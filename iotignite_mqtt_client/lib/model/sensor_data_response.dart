import 'package:iotignite_mqtt_client/model/data.dart';

class SensorDataResponse {
  String status;
  Data data;

  SensorDataResponse(this.status, this.data);

  factory SensorDataResponse.fromJson(Map<String, dynamic> json) {
    return SensorDataResponse(
        json["status"] as String, Data.fromJson(json["data"]));
  }

  @override
  String toString() {
    return 'SensorDataResponse{status: $status, data: $data}';
  }
}
