class SyuserAuditorResponse{

  String mail;
  String firstName;
  String lastName;
  bool enabled;
  Keys keys;
  String tenantDomain;
  String brand;
  int licenseCount;
  int licenseMonth;
  int trustAppSize;
  int trustUrlSize;
  int flowAppSize;
  int appStoreSize;
  int contentStoreSize;
  int flowProfilePolicySize;
  bool allDevicesAllowed;
  bool devicesWithoutDataGroupAllowed;
  List<AdminAreas> adminAreas;
  List<Roles> roles;
  List<dynamic> ipGroups;
  List<dynamic> links;
  String code;
  String lastModifiedDate;
  String createdDate;



}

class Keys{

  String apiKey;
  String secretKey;

  Keys(this.apiKey, this.secretKey);

  factory Keys.fromJson(Map<String, dynamic> json){
    return Keys(
        json["apiKey"] as String,
        json["secretKey"] as String,
    );
  }
}

class AdminAreas{

  String code;
  String tenantDomain;
  String name;

  AdminAreas(this.code, this.name, this.tenantDomain);

  factory AdminAreas.fromJson(Map<String, dynamic> json){
    return AdminAreas(
      json["code"] as String,
      json["name"] as String,
      json["tenantDomain"] as String,
    );
  }
}

class Roles{

  String name;
  String desc;
  List<Permissions> permissions;

  Roles(this.name, this.desc, this.permissions);

  factory Roles.fromJson(Map<String, dynamic> json){

    var permissionsJsonArray = json["permissions"] as List;
    List<Permissions> permissionList = permissionsJsonArray.map((x) => Permissions.fromJson(x)).toList();

    return Roles(
      json["name"] as String,
      json["desc"] as String,
      permissionList,
    );
  }
}

class Permissions{

  String name;
  String desc;

  Permissions(this.name, this.desc);

  factory Permissions.fromJson(Map<String, dynamic> json){
    return Permissions(
      json["name"] as String,
      json["desc"] as String,
    );
  }
}

/*
"ipGroups": [
{
"description": "string",
"id": 0,
"ipList": [
"string"
],
"name": "string"
}
],
*/