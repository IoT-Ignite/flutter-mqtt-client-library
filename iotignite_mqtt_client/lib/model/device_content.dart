import 'package:iotignite_mqtt_client/model/network.dart';
import 'package:iotignite_mqtt_client/model/presence.dart';
import 'package:iotignite_mqtt_client/model/os_profile.dart';
import 'package:iotignite_mqtt_client/model/links.dart';
import 'package:iotignite_mqtt_client/model/battery.dart';
import 'package:iotignite_mqtt_client/model/storage.dart';
import 'package:iotignite_mqtt_client/model/current_user.dart';
import 'package:iotignite_mqtt_client/model/users.dart';
import 'package:iotignite_mqtt_client/model/admin_area.dart';
import 'package:iotignite_mqtt_client/model/active_policy.dart';
import 'package:iotignite_mqtt_client/model/telephony.dart';
import 'package:iotignite_mqtt_client/model/wifi.dart';
import 'package:iotignite_mqtt_client/model/bluetooth.dart';
import 'package:iotignite_mqtt_client/model/profile.dart';
import 'package:iotignite_mqtt_client/model/policy.dart';



class DeviceContent {
  String deviceId;
  String status;
  String model;
  bool lockStatus;
  bool mandatoryLockStatus;
  bool lostStatus;
  int createdDate;
  int lastModifiedDate;
  int detailLastModifiedDate;
  int lastPresenceDate;
  Presence presence;
  Network network;
  OsProfile osProfile;
  List<Links> links;
  String code;
  String label;
  Battery battery;
  Storage storage;
  CurrentUser currentUser;
  List<Users> users;
  AdminArea adminArea;
  ActivePolicy activePolicy;
  String afexMode;
  String currentPolicy;
  String deviceTimezone;
  String deviceCurrentTime;

  DeviceContent(
      this.deviceId,
      this.status,
      this.model,
      this.lockStatus,
      this.mandatoryLockStatus,
      this.lostStatus,
      this.createdDate,
      this.lastModifiedDate,
      this.detailLastModifiedDate,
      this.lastPresenceDate,
      this.presence,
      this.network,
      this.osProfile,
      this.links,
      this.code,
      this.label,
      this.battery,
      this.storage,
      this.currentUser,
      this.users,
      this.adminArea,
      this.activePolicy,
      this.afexMode,
      this.currentPolicy,
      this.deviceTimezone,
      this.deviceCurrentTime);

  factory DeviceContent.fromJson(Map<String, dynamic> json) {
    var userListJsonArray = json["users"] == null ? [] : json["users"] as List;
    List<Users> userList;
    userList = userListJsonArray.map((x) => Users.fromJson(x)).toList();

    var linksJsonArray = json["links"] as List;
    List<Links> linksList = linksJsonArray.map((y) => Links.fromJson(y)).toList();

    return DeviceContent(
      json["deviceId"] as String,
      json["status"] as String,
      json["model"] == null ? "" : json["model"] as String,
      json["lockStatus"] as bool,
      json["mandatoryLockStatus"] as bool,
      json["lostStatus"] as bool,
      json["createdDate"] as int,
      json["lastModifiedDate"] as int,
      json["detailLastModifiedDate"] as int,
      json["lastPresenceDate"] == null ? 0 : json["lastPresenceDate"] as int,
      Presence.fromJson(json["presence"]),
      json["network"] == null ? Network(
          Telephony(
              false, "", "", [], "", []
          ),
          Wifi(
              "", "", "", "", "", "", false, "", "", "", ""
          ),
          Bluetooth(
              "", [], false, []
          )
      ) : Network.fromJson(json["network"]),
      json["osProfile"] == null ? OsProfile([], [], [], [], [], "", [], []
      ) : OsProfile.fromJson(json["osProfile"]),
      linksList,
      json["code"] as String,
      json["label"] == null ? "" : json["label"] as String,
      json["battery"] == null ? Battery("", "", "", "") : Battery.fromJson(json["battery"]),
      json["storage"] == null ? Storage(
          "", "", "", false, "") : Storage.fromJson(json["storage"]),
      json["currentUser"] == null ? CurrentUser(
          "", "", "", "", "", "", [], false, false, 0, Profile("", "", Policy("", "")), false
      ) : CurrentUser.fromJson(json["currentUser"]),
      userList,
      json["adminArea"] == null ? AdminArea("", "", "") : AdminArea.fromJson(json["adminArea"]),
      json["activePolicy"] == null ? ActivePolicy("", "") : ActivePolicy.fromJson(json["activePolicy"]),
      json["afexMode"] == null ? "" : json["afexMode"] as String,
      json["currentPolicy"] == null ? "" : json["currentPolicy"] as String,
      json["deviceTimezone"] == null ? "" : json["deviceTimezone"] as String,
      json["deviceCurrentTime"] == null ? "" : json["deviceCurrentTime"] as String,
    );
  }

  @override
  String toString() {
    return 'Content{deviceId: $deviceId, status: $status, model: $model, lockStatus: $lockStatus, mandatoryLockStatus: $mandatoryLockStatus, lostStatus: $lostStatus, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate, detailLastModifiedDate: $detailLastModifiedDate, lastPresenceDate: $lastPresenceDate, presence: $presence, network: $network, osProfile: $osProfile, links: $links, code: $code, label: $label, battery: $battery, storage: $storage, currentUser: $currentUser, users: $users, adminArea: $adminArea, activePolicy: $activePolicy, afexMode: $afexMode, currentPolicy: $currentPolicy, deviceTimezone: $deviceTimezone, deviceCurrentTime: $deviceCurrentTime}';
  }
}
