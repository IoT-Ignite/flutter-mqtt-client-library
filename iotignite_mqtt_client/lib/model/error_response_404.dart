import 'package:iotignite_mqtt_client/model/Fields.dart';

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

