import 'package:iotignite_mqtt_client/model/permissions.dart';

class Roles {
  String name;
  String desc;
  List<Permissions> permissions;

  Roles(this.name, this.desc, this.permissions);

  factory Roles.fromJson(Map<String, dynamic> json) {
    var permissionsJson =
        json["permissions"] == null ? null : json["permissions"] as List;
    List<Permissions> permissionsList;
    if (permissionsList != null) {
      permissionsList =
          permissionsJson.map((x) => Permissions.fromJson(x)).toList();
    }

    return Roles(
      json["name"] as String,
      json["desc"] as String,
      permissionsList,
    );
  }

  @override
  String toString() {
    return 'Roles{name: $name, desc: $desc, permissions: $permissions}';
  }
}
