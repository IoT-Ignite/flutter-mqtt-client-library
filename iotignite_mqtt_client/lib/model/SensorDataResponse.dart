class SensorDataResponse {

  String status;
  Data data;

  SensorDataResponse(this.status, this.data);

  factory SensorDataResponse.fromJson(Map<String, dynamic> json){
    return SensorDataResponse(
        json["status"] as String,
        Data.fromJson(json["data"])
    );
  }
}

class Data {
  String deviceId;
  String command;
  String data;
  int createDate;
  String nodeId;
  String sensorId;
  int cloudDate;

  Data(this.deviceId, this.command, this.data, this.createDate, this.nodeId,
      this.sensorId, this.cloudDate);

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
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