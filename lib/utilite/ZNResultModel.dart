class ZNResultModel {
  var data;
  bool success;
  int code;
  var headers;

  ZNResultModel(this.data, this.success, this.code, {this.headers});
}

class ZNResultErrorEvent {
  final int code;
  final String message;

  ZNResultErrorEvent(this.code, this.message);
}
