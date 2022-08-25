import 'package:iotignite_mqtt_client/model/Network.dart';
import 'package:iotignite_mqtt_client/model/Presence.dart';
import 'package:iotignite_mqtt_client/model/OsProfile.dart';
import 'package:iotignite_mqtt_client/model/Links.dart';
import 'package:iotignite_mqtt_client/model/Battery.dart';
import 'package:iotignite_mqtt_client/model/Storage.dart';
import 'package:iotignite_mqtt_client/model/CurrentUser.dart';
import 'package:iotignite_mqtt_client/model/Users.dart';
import 'package:iotignite_mqtt_client/model/AdminArea.dart';
import 'package:iotignite_mqtt_client/model/ActivePolicy.dart';

class DeviceContent{

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

  factory DeviceContent.fromJson(Map<String, dynamic> json){

    var userListJsonArray = json["users"] == null ? null : json["users"] as List;
    List<Users> userList = null;
    if(userListJsonArray != null){
      userList = userListJsonArray.map((x) => Users.fromJson(x)).toList();
    }

    var linksJsonArray = json["links"] as List;
    List<Links> linksList = linksJsonArray.map((y) => Links.fromJson(y)).toList();

    return DeviceContent(
      json["deviceId"] as String,
      json["status"]  as String ,
      json["model"] == null ? null : json["model"] as String,
      json["lockStatus"] as bool,
      json["mandatoryLockStatus"] as bool,
      json["lostStatus"] as bool,
      json["createdDate"] as int,
      json["lastModifiedDate"] as int,
      json["detailLastModifiedDate"] as int,
      json["lastPresenceDate"] == null ? null : json["lastPresenceDate"] as int,
      Presence.fromJson(json["presence"]),
      json["network"] == null ? null : Network.fromJson(json["network"]),
      json["osProfile"] == null ? null : OsProfile.fromJson(json["osProfile"]),
      linksList,
      json["code"] as String,
      json["label"] == null ? null : json["label"] as String,
      json["battery"] == null ? null : Battery.fromJson(json["battery"]),
      json["storage"] == null ? null : Storage.fromJson(json["storage"]),
      json["currentUser"] == null ? null : CurrentUser.fromJson(json["currentUser"]),
      userList,
      json["adminArea"] == null ? null : AdminArea.fromJson(json["adminArea"]),
      json["activePolicy"] == null ? null : ActivePolicy.fromJson(json["activePolicy"]),
      json["afexMode"] == null ? null : json["afexMode"] as String,
      json["currentPolicy"] == null ? null : json["currentPolicy"] as String,
      json["deviceTimezone"] == null ? null : json["deviceTimezone"] as String,
      json["deviceCurrentTime"] == null ? null : json["deviceCurrentTime"] as String,
    );
  }

  @override
  String toString() {
    return 'Content{deviceId: $deviceId, status: $status, model: $model, lockStatus: $lockStatus, mandatoryLockStatus: $mandatoryLockStatus, lostStatus: $lostStatus, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate, detailLastModifiedDate: $detailLastModifiedDate, lastPresenceDate: $lastPresenceDate, presence: $presence, network: $network, osProfile: $osProfile, links: $links, code: $code, label: $label, battery: $battery, storage: $storage, currentUser: $currentUser, users: $users, adminArea: $adminArea, activePolicy: $activePolicy, afexMode: $afexMode, currentPolicy: $currentPolicy, deviceTimezone: $deviceTimezone, deviceCurrentTime: $deviceCurrentTime}';
  }
}