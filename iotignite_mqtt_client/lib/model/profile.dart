import 'package:iotignite_mqtt_client/model/policy.dart';

class Profile {
  String code;
  String name;
  Policy policy;

  Profile(this.code, this.name, this.policy);

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      json["code"] as String,
      json["name"] == null ? "" : json["name"] as String,
      Policy.fromJson(json["policy"]),
    );
  }

  @override
  String toString() {
    return 'Profile{code: $code, name: $name, policy: $policy}';
  }
}
