import 'package:iotignite_mqtt_client/model/lists.dart';

class SensorDataResponse {
  String status;
  Lists data;

  SensorDataResponse(this.status, this.data);

  factory SensorDataResponse.fromJson(Map<String, dynamic> json) {
    return SensorDataResponse(
        json["status"] as String, Lists.fromJson(json["data"]));
  }

  @override
  String toString() {
    return 'SensorDataResponse{status: $status, data: $data}';
  }
}
