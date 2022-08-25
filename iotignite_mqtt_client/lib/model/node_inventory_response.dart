import 'package:iotignite_mqtt_client/model/extras.dart';

class NodeInventoryResponse {
  String code;
  String status;
  String success;
  Extras extras;

  NodeInventoryResponse(this.code, this.status, this.success, this.extras);

  factory NodeInventoryResponse.fromJson(Map<String, dynamic> json) {
    return NodeInventoryResponse(
        json["code"] as String,
        json["status"] as String,
        json["success"] as String,
        Extras.fromJson(json["extras"]));
  }

  @override
  String toString() {
    return 'NodeInventoryResponse{code: $code, status: $status, success: $success, extras: $extras}';
  }
}
