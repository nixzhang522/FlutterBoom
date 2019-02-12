import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

const HOST = 'https://api-stage-en.boomschool.cn:446/app';

void get(url, callback, fail) {

  String path = '/app' + url;

  int seconds = (DateTime.now().millisecondsSinceEpoch / 1000).floor();

  String signature = "";

  var bytes = utf8.encode(signature);

  String digest = sha256.convert(bytes).toString();
  
  var headers = {"S": digest, "TS": "$seconds", "V":"2.1.0"};

  http.get(HOST + url, headers: headers).then((response) {
    
    print("Response status: ${response.statusCode}");
    //print("Response body: ${response.body}");
    
    if (response.statusCode == 200) {
      callback(jsonDecode(response.body));
    }
    else {
      fail(response.reasonPhrase);
    }

  });
}
