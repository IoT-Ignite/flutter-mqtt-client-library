class SensorDataHistoryResponse {

  List<Lists> list;
  int count;
  String lastId;

  SensorDataHistoryResponse(this.list, this.count, this.lastId);

  factory SensorDataHistoryResponse.fromJson(Map<String, dynamic> json){

    var listsJson = json["list"] as List;
    List<Lists> listsList = listsJson.map((x) => Lists.fromJson(x)).toList();

    return SensorDataHistoryResponse(
        listsList,
        json["count"] as int,
        json["lastId"] as String
    );
  }
}

class Lists {
  String deviceId;
  String command;
  String data;
  int createDate;
  String nodeId;
  String sensorId;
  int cloudDate;

  Lists(this.deviceId, this.command, this.data, this.createDate, this.nodeId,
      this.sensorId, this.cloudDate);

  factory Lists.fromJson(Map<String, dynamic> json){
    return Lists(
      json["deviceId"] as String,
      json["command"] as String,
      json["data"] as String,
      json["createDate"] as int,
      json["nodeId"] as String,
      json["sensorId"] as String,
      json["cloudDate"] as int,
    );
  }
}