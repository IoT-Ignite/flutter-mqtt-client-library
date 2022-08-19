class SyuserAuditorResponse {

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
  List<dynamic> adminAreas;
  List<Roles> roles;
  List<dynamic> ipGroups;
  List<dynamic> links;
  String code;
  String lastModifiedDate;
  String createdDate;

  SyuserAuditorResponse(this.mail,
      this.firstName,
      this.lastName,
      this.enabled,
      this.keys,
      this.tenantDomain,
      this.brand,
      this.licenseCount,
      this.licenseMonth,
      this.trustAppSize,
      this.trustUrlSize,
      this.flowAppSize,
      this.appStoreSize,
      this.contentStoreSize,
      this.flowProfilePolicySize,
      this.allDevicesAllowed,
      this.devicesWithoutDataGroupAllowed,
      this.adminAreas,
      this.roles,
      this.ipGroups,
      this.links,
      this.code,
      this.lastModifiedDate,
      this.createdDate);

  factory SyuserAuditorResponse.fromJson(Map<String, dynamic> json){

    var rolesJson = json["roles"] as List;
    List<Roles> rolesList = rolesJson.map((x) => Roles.fromJson(x)).toList();

    return SyuserAuditorResponse(
        json["mail"] as String,
        json["firstName"] as String,
        json["lastName"] as String,
        json["enabled"] as bool,
        Keys.fromJson(json["keys"]),
        json["tenantDomain"] as String,
        json["brand"] as String,
        json["licenseCount"] as int,
        json["licenseMonth"] as int,
        json["trustAppSize"] as int,
        json["trustUrlSize"] as int,
        json["flowAppSize"] as int,
        json["appStoreSize"] as int,
        json["contentStoreSize"] as int,
        json["flowProfilePolicySize"] as int,
        json["allDevicesAllowed"] as bool,
        json["devicesWithoutDataGroupAllowed"] as bool,
        json["adminAreas"] as List,
        rolesList,
        json["ipGroups"] as List,
        json["links"] as List,
        json["code"] as String,
        json["lastModifiedDate"] as String,
        json["createdDate"] as String
    );
  }
}

class Keys {
  String apiKey;
  String secretKey;

  Keys(this.apiKey, this.secretKey);

  factory Keys.fromJson(Map<String, dynamic> json) {
    return Keys(
      json["apiKey"] as String,
      json["secretKey"] as String,
    );
  }
}

class Roles {

  String name;
  String desc;
  List<Permissions> permissions;

  Roles(this.name, this.desc, this.permissions);

  factory Roles.fromJson(Map<String, dynamic> json){

    var permissionsJson = json["permissions"] as List;
    List<Permissions> permissionsList = permissionsJson.map((x) => Permissions.fromJson(x)).toList();

    return Roles(
      json["name"] as String,
      json["desc"] as String,
      permissionsList,
    );
  }
}

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
}


