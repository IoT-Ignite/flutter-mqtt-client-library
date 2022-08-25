class ErrorResponseForbidden {
  String result;
  String type;
  String message;
  String code;
  String desc;
  List<dynamic> links;
  List<dynamic> fields;

  ErrorResponseForbidden(this.result, this.type, this.message, this.code,
      this.desc, this.links, this.fields);

  factory ErrorResponseForbidden.fromJson(Map<String, dynamic> json) {
    return ErrorResponseForbidden(
      json["result"] as String,
      json["type"] as String,
      json["message"] as String,
      json["code"] as String,
      json["desc"] as String,
      json["links"] as List,
      json["fields"] as List,
    );
  }
}
