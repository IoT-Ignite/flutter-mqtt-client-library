class Fields {

  int code;
  String field;
  dynamic value;
  String message;

  Fields(this.code, this.field, this.value, this.message);

  factory Fields.fromJson(Map<String, dynamic> json){
    return Fields(
      json["code"] as int,
      json["field"] as String,
      json["value"] as dynamic,
      json["message"] as String,
    );
  }
}