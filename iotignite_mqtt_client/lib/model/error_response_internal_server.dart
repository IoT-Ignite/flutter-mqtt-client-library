class ErrorResponseInternalServer {
  String result;
  String type;
  String message;
  String code;
  String desc;
  List<dynamic> links;

  ErrorResponseInternalServer(
      this.result, this.type, this.message, this.code, this.desc, this.links);

  factory ErrorResponseInternalServer.fromJson(Map<String, dynamic> json) {
    return ErrorResponseInternalServer(
      json["result"] as String,
      json["type"] as String,
      json["message"] as String,
      json["code"] as String,
      json["desc"] as String,
      json["links"] as List,
    );
  }
}
