import 'package:event_bus/event_bus.dart';

import 'result_model.dart';

class ResultCode {
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;

  static final EventBus eventBus = new EventBus();

  static errorHandleFunction(code, message, noTip) {
    if (code == 401) {
      message = "网络错误，请稍后重试";
    }
    if (code == 403) {
      message = "登录时效，请重新登录";
    }
    if (code == 404) {
      message = "网络错误，请稍后重试";
    }
    if(noTip) {
      return message;
    }
    eventBus.fire(new ResultErrorEvent(code, message));
    return message;
  }
}