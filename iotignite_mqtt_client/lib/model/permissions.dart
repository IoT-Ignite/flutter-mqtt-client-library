class Permissions {

  String name;
  String desc;

  Permissions(this.name, this.desc);

  factory Permissions.fromJson(Map<String, dynamic> json){
    return Permissions(
      json["name"] as String,
      json["desc"] as String,
    );
  }

  @override
  String toString() {
    return 'Permissions{name: $name, desc: $desc}';
  }
}