import 'package:iotignite_mqtt_client/model/data.dart';

class SensorDataHistoryResponse {
  List<Data> list;
  int count;
  String lastId;

  SensorDataHistoryResponse(this.list, this.count, this.lastId);

  factory SensorDataHistoryResponse.fromJson(Map<String, dynamic> json) {
    var listsJson = json["list"] as List;
    List<Data> listsList = listsJson.map((x) => Data.fromJson(x)).toList();

    return SensorDataHistoryResponse(
        listsList, json["count"] as int, json["lastId"] as String);
  }

  @override
  String toString() {
    return 'SensorDataHistoryResponse{list: $list, count: $count, lastId: $lastId}';
  }
}
