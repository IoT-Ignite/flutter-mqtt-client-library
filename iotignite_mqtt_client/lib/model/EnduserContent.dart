import 'package:iotignite_mqtt_client/model/AdminArea.dart';
import 'package:iotignite_mqtt_client/model/Profile.dart';
import 'package:iotignite_mqtt_client/model/Links.dart';

class EnduserContent {
  String mail;
  String firstName;
  String lastName;
  String identityNo;
  bool enabled;
  AdminArea adminArea;
  Profile profile;
  List<Links> links;
  String code;
  String activationCode;
  bool activated;
  int createdDate;
  int activationDate;

  EnduserContent(
      this.mail,
      this.firstName,
      this.lastName,
      this.identityNo,
      this.enabled,
      this.adminArea,
      this.profile,
      this.links,
      this.code,
      this.activationCode,
      this.activated,
      this.createdDate,
      this.activationDate);

  @override
  String toString() {
    return 'Content{mail: $mail, firstName: $firstName, lastName: $lastName, identityNo: $identityNo, enabled: $enabled, adminArea: $adminArea, profile: $profile, links: $links, code: $code, activationCode: $activationCode, activated: $activated, createdDate: $createdDate, activationDate: $activationDate}';
  }

  factory EnduserContent.fromJson(Map<String, dynamic> json) {
    var linksJsonArray = json["links"] as List;
    List<Links> linksList = linksJsonArray
        .map((linksJsonArrayObj) => Links.fromJson(linksJsonArrayObj))
        .toList();

    return EnduserContent(
      json["mail"] as String,
      json["firstName"] as String,
      json["lastName"] as String,
      json["identityNo"] as String,
      json["enabled"] as bool,
      AdminArea.fromJson(json["adminArea"]),
      Profile.fromJson(json["profile"]),
      linksList,
      json["code"] as String,
      json["activationCode"] as String,
      json["activated"] as bool,
      json["createdDate"] as int,
      json["activationDate"] as int,
    );
  }

}