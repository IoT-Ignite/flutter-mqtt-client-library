import 'package:iotignite_mqtt_client/model/Things.dart';

class Nodes {
  String nodeId;
  int connected;
  String description;
  List<Things> things;

  Nodes(this.nodeId, this.connected, this.description, this.things);

  factory Nodes.fromJson(Map<String, dynamic> json){

    var thingsJson = json["things"] as List;
    List<Things> thingsList = thingsJson.map((x) => Things.fromJson(x)).toList();

    return Nodes(
        json["nodeId"] as String,
        json["connected"] as int,
        json["description"] as String,
        thingsList
    );
  }

  @override
  String toString() {
    return 'Nodes{nodeId: $nodeId, connected: $connected, description: $description, things: $things}';
  }
}


