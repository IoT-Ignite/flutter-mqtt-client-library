/*
class SettingsMessagerAppKeyResponse{

  String appkey;
  bool enabled;
  List<dynamic> links;

  SettingsMessagerAppKeyResponse(this.appkey, this.enabled, this.links);

  factory SettingsMessagerAppKeyResponse.fromJson(Map<String, dynamic> json){

    var linkListArray = json["links"] as List;
    List<dynamic> linkList = linkListArray.map((userListJsonArrayObj) => dynamic.fromJson(userListJsonArrayObj)).toList();



    //links = List.castFrom<dynamic, dynamic>(json['links']);

    return SettingsMessagerAppKeyResponse(
      json["appkey"] as String,
      json["enabled"] as bool,
      linksList,
    );
  }
} */

class SettingsMessagerAppKeyResponse {

  String appkey;
  bool enabled;
  List<dynamic> links;

  SettingsMessagerAppKeyResponse(this.appkey, this.enabled, this.links);

  SettingsMessagerAppKeyResponse.fromJson(Map<String, dynamic> json){
    appkey = json['appkey'];
    enabled = json['enabled'];
    links = List.castFrom<dynamic, dynamic>(json['links']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['appkey'] = appkey;
    _data['enabled'] = enabled;
    _data['links'] = links;
    return _data;
  }
}



