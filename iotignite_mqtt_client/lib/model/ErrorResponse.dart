class ErrorResponse {

  String error;
  String error_description;

  ErrorResponse(this.error, this.error_description);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      json["error"] as String,
      json["error_description"] as String,
    );
  }
}

// ======================================================

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

// ======================================================

class ErrorResponse404 {

  String result;
  String type;
  String message;
  String code;
  String desc;
  List<dynamic> links;
  List<Fields> fields;

  ErrorResponse404(this.result, this.type, this.message, this.code,
      this.desc, this.links, this.fields);

  factory ErrorResponse404.fromJson(Map<String, dynamic> json){

    var fieldsJson = json["fields"] as List;
    List<Fields> fieldsList = fieldsJson.map((x) => Fields.fromJson(x)).toList();

    return ErrorResponse404(
        json["result"] as String,
        json["type"] as String,
        json["message"] as String,
        json["code"] as String,
        json["desc"] as String,
        json["links"] as List,
        fieldsList
    );
  }
}

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

// ======================================================

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