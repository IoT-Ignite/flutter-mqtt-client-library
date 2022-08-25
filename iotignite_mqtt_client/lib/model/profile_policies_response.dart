import 'package:iotignite_mqtt_client/model/links.dart';
import 'package:iotignite_mqtt_client/model/policy_profile.dart';

class ProfilePoliciesResponse {
  String code;
  String type;
  String desc;
  PolicyProfile policyProfile;
  bool defaults;
  int createdDate;
  dynamic startDate;
  dynamic endDate;
  List<Links> links;

  ProfilePoliciesResponse(
      this.code,
      this.type,
      this.desc,
      this.policyProfile,
      this.defaults,
      this.createdDate,
      this.startDate,
      this.endDate,
      this.links);

  @override
  String toString() {
    return 'ProfilePoliciesResponse{code: $code, type: $type, desc: $desc, policyProfile: $policyProfile, defaults: $defaults, createdDate: $createdDate, startDate: $startDate, endDate: $endDate, links: $links}';
  }

  factory ProfilePoliciesResponse.fromJson(Map<String, dynamic> json) {
    var linksJson = json["links"] as List;
    List<Links> linksList = linksJson.map((y) => Links.fromJson(y)).toList();

    return ProfilePoliciesResponse(
        json["code"] as String,
        json["type"] as String,
        json["desc"] as String,
        PolicyProfile.fromJson(json["policyProfile"]),
        json["defaults"] as bool,
        json["createdDate"] as int,
        json["startDate"] as dynamic,
        json["endDate"] as dynamic,
        linksList);
  }
}
