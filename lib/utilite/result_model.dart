class ResultModel {
  var data;
  bool success;
  int code;
  var headers;

  ResultModel(this.data, this.success, this.code, {this.headers});
}

class ResultErrorEvent {
  final int code;
  final String message;

  ResultErrorEvent(this.code, this.message);
}
