import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:crypto/crypto.dart';

import 'package:boomenglish/help/user_manager.dart';

import 'config.dart';
import 'result_model.dart';
import 'result_code.dart';

class RequestManager {
  static String baseUrl = "https://api-stage-en.boomschool.cn:446/app";
  static Map<String, String> baseHeaders = {
    "V": "2.2.0",
    "Content-Type": "application/json"
  };

  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static get(url, params, {noTip = false}) async {
    Options option = Options(method: "GET");
    return await requestBase(url, params, baseHeaders, option, noTip: noTip);
  }

  static post(url, params, {noTip = false}) async {
    Options option = Options(method: "POST");
    return await requestBase(url, params, baseHeaders, option, noTip: noTip);
  }

  static requestBase(url, params, Map<String, String> header, Options option,
      {noTip = false}) async {
    // 判断网络
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else if (connectivityResult == ConnectivityResult.none) {
      return ResultModel(ResultErrorEvent(ResultCode.NETWORK_ERROR, "请检查网络"),
          false, ResultCode.NETWORK_ERROR);
    }

    //处理请求头
    Map<String, String> headers = HashMap();

    String path = '/app' + url;
    int seconds = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
    UserManager userManager = UserManager();
    String boomId = userManager.isLogin ? userManager.user.boomId : "";
    String token = userManager.isLogin ? userManager.token : "";
    String signature =
        "";
    var bytes = utf8.encode(signature);
    String digest = sha256.convert(bytes).toString();
    Map<String, String> signatureMap = {
      "S": digest,
      "TS": "$seconds",
      "Authorization": token
    };
    headers.addAll(signatureMap);

    if (header != null) {
      headers.addAll(header);
    }

    //options处理
    option.headers = headers;
    option.connectTimeout = 15000;

    var dio = Dio(BaseOptions(baseUrl: baseUrl));
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }
      // 超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.NETWORK_TIMEOUT;
      }
      // debug模式才打印
      if (Config.debug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求参数：' + params.toString());
        print('请求头: ' + option.headers.toString());
        print('method: ' + option.method);
        print('statusCode: ' + errorResponse.statusCode.toString());
      }
      return ResultModel({
        "data": null,
        "message": ResultCode.errorHandleFunction(
            errorResponse.statusCode, error.message, noTip)
      }, false, errorResponse.statusCode, headers: option.headers);
    }

    // debug模式打印相关数据
    if (Config.debug) {
      print('请求url: ' + url);
      print('请求头: ' + option.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }

    if (response.statusCode == 200) {
      return ResultModel(response.data, true, ResultCode.SUCCESS,
          headers: response.headers);
    } else {
      return ResultModel({
        "data": response.data,
        "message": ResultCode.errorHandleFunction(
            response.statusCode, response.data["message"], noTip)
      }, false, response.statusCode,
          headers: response.headers);
    }
  }
}
