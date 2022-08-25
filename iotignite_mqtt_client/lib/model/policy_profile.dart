import 'package:iotignite_mqtt_client/model/Settings.dart';
import 'package:iotignite_mqtt_client/model/InstallationPolicies.dart';
import 'package:iotignite_mqtt_client/model/WifiApnPolicies.dart';
import 'package:iotignite_mqtt_client/model/HotspotConfig.dart';

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

  @override
  String toString() {
    return 'PolicyProfile{name: $name, bookmarks: $bookmarks, settings: $settings, applicationPolicies: $applicationPolicies, applicationBlackPermissions: $applicationBlackPermissions, installationPolicies: $installationPolicies, wifiApnPolicies: $wifiApnPolicies, applicationShortcuts: $applicationShortcuts, wificonfigs: $wificonfigs, mobileApnConfigs: $mobileApnConfigs, hotspotConfig: $hotspotConfig, ecrSettings: $ecrSettings, passwordPolicy: $passwordPolicy}';
  }
}









