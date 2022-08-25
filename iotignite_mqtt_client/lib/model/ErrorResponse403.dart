class ErrorResponse403 {

  String result;
  String type;
  String message;
  String code;
  String desc;
  List<dynamic> links;
  List<dynamic> fields;

  ErrorResponse403(this.result, this.type, this.message, this.code,
      this.desc, this.links, this.fields);

  factory ErrorResponse403.fromJson(Map<String, dynamic> json){

    return ErrorResponse403(
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