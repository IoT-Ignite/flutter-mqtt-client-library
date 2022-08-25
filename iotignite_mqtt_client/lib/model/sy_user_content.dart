import 'package:iotignite_mqtt_client/model/Roles.dart';

class SyuserContent {

  String mail;
  String firstName;
  String lastName;
  bool enabled;
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

  SyuserContent(
      this.mail,
      this.firstName,
      this.lastName,
      this.enabled,
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

  @override
  String toString() {
    return 'Content{mail: $mail, firstName: $firstName, lastName: $lastName, enabled: $enabled, licenseCount: $licenseCount, licenseMonth: $licenseMonth, trustAppSize: $trustAppSize, trustUrlSize: $trustUrlSize, flowAppSize: $flowAppSize, appStoreSize: $appStoreSize, contentStoreSize: $contentStoreSize, flowProfilePolicySize: $flowProfilePolicySize, allDevicesAllowed: $allDevicesAllowed, devicesWithoutDataGroupAllowed: $devicesWithoutDataGroupAllowed, adminAreas: $adminAreas, roles: $roles, ipGroups: $ipGroups, links: $links, code: $code, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate}';
  }

  factory SyuserContent.fromJson(Map<String, dynamic> json){

    var rolesJson = json["roles"] as List;
    List<Roles> rolesList = rolesJson.map((x) => Roles.fromJson(x)).toList();

    return SyuserContent(
        json["mail"] as String,
        json["firstName"] as String,
        json["lastName"] as String,
        json["enabled"] as bool,
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