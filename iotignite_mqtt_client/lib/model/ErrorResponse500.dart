class ErrorResponse500 {

  String result;
  String type;
  String message;
  String code;
  String desc;
  List<dynamic> links;

  ErrorResponse500(this.result, this.type, this.message, this.code,
      this.desc, this.links);

  factory ErrorResponse500.fromJson(Map<String, dynamic> json){

    return ErrorResponse500(
      json["result"] as String,
      json["type"] as String,
      json["message"] as String,
      json["code"] as String,
      json["desc"] as String,
      json["links"] as List,
    );
  }
}