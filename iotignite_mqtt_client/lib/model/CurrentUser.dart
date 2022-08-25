import 'package:iotignite_mqtt_client/model/Profile.dart';

class CurrentUser{
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

  CurrentUser(
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
    return 'CurrentUser{code: $code, mail: $mail, firstName: $firstName, lastName: $lastName, activationCode: $activationCode, identityNo: $identityNo, phoneNumber: $phoneNumber, enabled: $enabled, activated: $activated, activationDate: $activationDate, profile: $profile, current: $current}';
  }

  factory CurrentUser.fromJson(Map<String, dynamic> json){
    return CurrentUser(
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
