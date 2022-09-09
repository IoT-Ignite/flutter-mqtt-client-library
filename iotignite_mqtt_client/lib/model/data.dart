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

  @override
  String toString() {
    return 'Lists{deviceId: $deviceId, command: $command, data: $data, createDate: $createDate, nodeId: $nodeId, sensorId: $sensorId, cloudDate: $cloudDate}';
  }
}