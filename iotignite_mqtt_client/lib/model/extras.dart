import 'package:iotignite_mqtt_client/model/Nodes.dart';

class Extras {
  List<Nodes> nodes;

  Extras(this.nodes);

  factory Extras.fromJson(Map<String, dynamic> json){

    var nodesJson = json["nodes"] as List;
    List<Nodes> nodesList = nodesJson.map((x) => Nodes.fromJson(x)).toList();

    return Extras(
        nodesList
    );
  }

  @override
  String toString() {
    return 'Extras{nodes: $nodes}';
  }
}

