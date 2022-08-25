import 'package:iotignite_mqtt_client/model/fields.dart';

class ErrorResponseNotFound {
  String result;
  String type;
  String message;
  String code;
  String desc;
  List<dynamic> links;
  List<Fields> fields;

  ErrorResponseNotFound(this.result, this.type, this.message, this.code,
      this.desc, this.links, this.fields);

  factory ErrorResponseNotFound.fromJson(Map<String, dynamic> json) {
    var fieldsJson = json["fields"] as List;
    List<Fields> fieldsList =
        fieldsJson.map((x) => Fields.fromJson(x)).toList();

    return ErrorResponseNotFound(
        json["result"] as String,
        json["type"] as String,
        json["message"] as String,
        json["code"] as String,
        json["desc"] as String,
        json["links"] as List,
        fieldsList);
  }
}
