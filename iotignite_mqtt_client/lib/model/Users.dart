import 'package:iotignite_mqtt_client/model/profile.dart';

class Users {
  String code;
  String mail;
  String firstName;
  String lastName;
  String activationCode;
  String identityNo;
  dynamic phoneNumber;
  bool enabled;
  bool activated;
  int activationDate;
  Profile profile;
  bool current;

  Users(
      this.code,
      this.mail,
      this.firstName,
      this.lastName,
      this.activationCode,
      this.identityNo,
      this.phoneNumber,
      this.enabled,
      this.activated,
      this.activationDate,
      this.profile,
      this.current);

  @override
  String toString() {
    return 'Users{code: $code, mail: $mail, firstName: $firstName, lastName: $lastName, activationCode: $activationCode, identityNo: $identityNo, phoneNumber: $phoneNumber, enabled: $enabled, activated: $activated, activationDate: $activationDate, profile: $profile, current: $current}';
  }

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      json["code"] as String,
      json["mail"] as String,
      json["firstName"] as String,
      json["lastName"] as String,
      json["activationCode"] as String,
      json["identityNo"] as String,
      json["phoneNumber"] as dynamic,
      json["enabled"] as bool,
      json["activated"] as bool,
      json["activationDate"] as int,
      Profile.fromJson(json["profile"]),
      json["current"] as bool,
    );
  }
}
