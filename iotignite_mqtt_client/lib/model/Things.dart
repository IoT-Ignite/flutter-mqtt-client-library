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

  @override
  String toString() {
    return 'Things{id: $id, type: $type, vendor: $vendor, connected: $connected, description: $description, actuator: $actuator}';
  }
}