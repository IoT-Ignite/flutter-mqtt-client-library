class ProfilePoliciesResponse{

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

  factory ProfilePoliciesResponse.fromJson(Map<String, dynamic> json){

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
        linksList
    );
  }
}

class PolicyProfile {

  String name;
  List<dynamic> bookmarks;
  List<Settings> settings;
  List<dynamic> applicationPolicies;
  List<dynamic> applicationBlackPermissions;
  InstallationPolicies installationPolicies;
  WifiApnPolicies wifiApnPolicies;
  List<dynamic> applicationShortcuts;
  List<dynamic> wificonfigs;
  List<dynamic> mobileApnConfigs;
  HotspotConfig hotspotConfig;
  dynamic ecrSettings;
  dynamic passwordPolicy;

  PolicyProfile(
      this.name,
      this.bookmarks,
      this.settings,
      this.applicationPolicies,
      this.applicationBlackPermissions,
      this.installationPolicies,
      this.wifiApnPolicies,
      this.applicationShortcuts,
      this.wificonfigs,
      this.mobileApnConfigs,
      this.hotspotConfig,
      this.ecrSettings,
      this.passwordPolicy);

  factory PolicyProfile.fromJson(Map<String, dynamic> json){

    var settingsJson = json["settings"] as List;
    List<Settings> settingsList = settingsJson.map((y) => Settings.fromJson(y)).toList();

    return PolicyProfile(
        json["name"] as String,
        json["bookmarks"] as List,
        settingsList,
        json["applicationPolicies"] as List,
        json["applicationBlackPermissions"] as List,
        InstallationPolicies.fromJson(json["installationPolicies"]),
        WifiApnPolicies.fromJson(json["wifiApnPolicies"]),
        json["applicationShortcuts"] as List,
        json["wificonfigs"] as List,
        json["mobileApnConfigs"] as List,
        HotspotConfig.fromJson(json["hotspotConfig"]),
        json["ecrSettings"] as dynamic,
        json["passwordPolicy"] as dynamic
    );
  }
}

class HotspotConfig {

  String ssid;
  String password;
  String security;

  HotspotConfig(this.ssid, this.password, this.security);

  factory HotspotConfig.fromJson(Map<String, dynamic> json){
    return HotspotConfig(
        json["ssid"] as String,
        json["password"] as String,
        json["security"] as String,
    );
  }
}

class WifiApnPolicies {

  List<dynamic> blackList;
  List<dynamic> whiteList;
  List<dynamic> trustedStores;
  List<dynamic> ruleOrders;

  WifiApnPolicies(
      this.blackList, this.whiteList, this.trustedStores, this.ruleOrders);

  factory WifiApnPolicies.fromJson(Map<String, dynamic> json){
    return WifiApnPolicies(
        json["blackList"] as List,
        json["whiteList"] as List,
        json["trustedStores"] as List,
        json["ruleOrders"] as List
    );
  }
}

class InstallationPolicies {

  List<dynamic> blackList;
  List<dynamic> whiteList;
  List<dynamic> trustedStores;
  List<dynamic> ruleOrders;

  InstallationPolicies(
      this.blackList, this.whiteList, this.trustedStores, this.ruleOrders);

  factory InstallationPolicies.fromJson(Map<String, dynamic> json){
    return InstallationPolicies(
        json["blackList"] as List,
        json["whiteList"] as List,
        json["trustedStores"] as List,
        json["ruleOrders"] as List
    );
  }
}

class Settings {

  String name;
  String value;

  Settings(this.name, this.value);

  factory Settings.fromJson(Map<String, dynamic> json){
    return Settings(
        json["name"] as String,
        json["value"] as String
    );
  }
}

class Links{
  String rel;
  String href;

  Links(this.rel, this.href);

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      json["rel"] as String,
      json["href"] as String,
    );
  }
}