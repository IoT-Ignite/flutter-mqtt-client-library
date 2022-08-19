class NodeInventoryResponse {
  String code;
  String status;
  String success;
  Extras extras;

  NodeInventoryResponse(this.code, this.status, this.success, this.extras);

  factory NodeInventoryResponse.fromJson(Map<String, dynamic> json){
    return NodeInventoryResponse(
        json["code"] as String,
        json["status"] as String,
        json["success"] as String,
        Extras.fromJson(json["extras"])
    );
  }
}

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
}

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

  }

class Things {
  String id;
  String type;
  String vendor;
  int connected;
  String description;
  bool actuator;

  Things(this.id, this.type, this.vendor, this.connected, this.description,
      this.actuator);

  factory Things.fromJson(Map<String, dynamic> json){
    return Things(
        json["id"] as String,
        json["type"] as String,
        json["vendor"] as String,
        json["connected"] as int,
        json["description"] as String,
        json["actuator"] as bool
    );
  }
}

