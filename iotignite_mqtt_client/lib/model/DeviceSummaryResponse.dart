import 'package:iotignite_mqtt_client/model/DeviceResponse.dart';

class DeviceSummaryResponse{

  List<Links> links;
  List<Content> content;
  Page page;

  DeviceSummaryResponse(this.links, this.content, this.page);

  factory DeviceSummaryResponse.fromJson(Map<String, dynamic> json){

    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray.map((x) => Links.fromJson(x)).toList();

    var contentsJsonArray = json["content"] as List;
    List<Content> contentList = contentsJsonArray.map((y) => Content.fromJson(y)).toList();

    return DeviceSummaryResponse(
        linkList,
        contentList,
        Page.fromJson(json["page"])
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

class Content{

  String deviceId;
  String status;
  String model;
  bool lockStatus;
  bool lostStatus;
  int createdDate;
  int lastPresenceDate;
  Presence presence;
  Network network;
  OsProfile osProfile;
  AdminArea adminArea;
  ActivePolicy activePolicy;
  String afexMode;
  String currentPolicy;
  String deviceTimezone;
  String deviceCurrentTime;
  List<Links> links;
  String code;

  Content(
      this.deviceId,
      this.status,
      this.model,
      this.lockStatus,
      this.lostStatus,
      this.createdDate,
      this.lastPresenceDate,
      this.presence,
      this.network,
      this.osProfile,
      this.adminArea,
      this.activePolicy,
      this.afexMode,
      this.currentPolicy,
      this.deviceTimezone,
      this.deviceCurrentTime,
      this.links,
      this.code);

  factory Content.fromJson(Map<String, dynamic> json){

    var linksJsonArray = json["links"] as List;
    List<Links> linksList = linksJsonArray.map((y) => Links.fromJson(y)).toList();

    return Content(
      json["deviceId"] as String,
      json["status"] as String,
      json["model"] as String,
      json["lockStatus"] as bool,
      json["lostStatus"] as bool,
      json["createdDate"] as int,
      json["lastPresenceDate"] as int,
      Presence.fromJson(json["presence"]),
      Network.fromJson(json["network"]),
      OsProfile.fromJson(json["osProfile"]),
      AdminArea.fromJson(json["adminArea"]),
      ActivePolicy.fromJson(json["activePolicy"]),
      json["afexMode"] as String,
      json["currentPolicy"] as String,
      json["deviceTimezone"] as String,
      json["deviceCurrentTime"] as String,
      linksList,
      json["code"] as String,
    );
  }
}

class Presence{
  String state;
  dynamic clientIp;

  Presence(this.state, this.clientIp);

  factory Presence.fromJson(Map<String, dynamic> json){
    return Presence(
      json["state"] as String,
      json["clientIp"] as dynamic,
    );
  }
}

class Battery{
  String scale;
  String level;
  String source;
  String voltage;

  Battery(this.scale, this.level, this.source, this.voltage);

  factory Battery.fromJson(Map<String, dynamic> json){
    return Battery(
      json["scale"] as String,
      json["level"] as String,
      json["source"] as String,
      json["voltage"] as String,
    );
  }
}

class Network{
  Telephony telephony;
  Wifi wifi;
  dynamic bluetooth;

  Network(this.telephony, this.wifi, this.bluetooth);

  factory Network.fromJson(Map<String, dynamic> json){
    return Network(
      Telephony.fromJson(json["telephony"]),
      Wifi.fromJson(json["wifi"]),
      json["bluetooth"] as dynamic,
    );
  }
}

class OsProfile{
  dynamic hardware;
  dynamic host;
  dynamic display;
  dynamic product;
  dynamic board;
  dynamic model;
  dynamic device;
  dynamic serial;

  OsProfile(this.hardware, this.host, this.display, this.product, this.board,
      this.model, this.device, this.serial);

  factory OsProfile.fromJson(Map<String, dynamic> json){
    return OsProfile(
        json["hardware"] as dynamic,
        json["host"] as dynamic,
        json["display"] as dynamic,
        json["product"] as dynamic,
        json["board"] as dynamic,
        json["model"] as dynamic,
        json["device"] as dynamic,
        json["serial"] as dynamic
    );
  }
}

class Storage{
  String availIntMemSize;
  String totalExtMemSize;
  String totalIntMemSize;
  bool isExtMemAvail;
  String availExtMemSize;

  Storage(this.availIntMemSize, this.totalExtMemSize, this.totalIntMemSize,
      this.isExtMemAvail, this.availExtMemSize);

  factory Storage.fromJson(Map<String, dynamic> json){
    return Storage(
      json["availIntMemSize"] as String,
      json["totalExtMemSize"] as String,
      json["totalIntMemSize"] as String,
      json["isExtMemAvail"] as bool,
      json["availExtMemSize"] as String,
    );
  }
}

class CurrentUser{
  dynamic code;
  String mail;
  String firstName;
  String lastName;
  dynamic activationCode;
  String identityNo;
  dynamic phoneNumber;
  bool enabled;
  bool activated;
  dynamic activationDate;
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

  factory CurrentUser.fromJson(Map<String, dynamic> json){
    return CurrentUser(
      json["code"] as dynamic,
      json["mail"] as String,
      json["firstName"] as String,
      json["lastName"] as String,
      json["activationCode"] as dynamic,
      json["identityNo"] as String,
      json["phoneNumber"] as dynamic,
      json["enabled"] as bool,
      json["activated"] as bool,
      json["activationDate"] as dynamic,
      Profile.fromJson(json["profile"]),
      json["current"] as bool,
    );
  }
}

class Users{
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

  factory Users.fromJson(Map<String, dynamic> json){
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

class AdminArea{
  dynamic code;
  String name;

  AdminArea(this.code, this.name);

  factory AdminArea.fromJson(Map<String, dynamic> json){
    return AdminArea(
      json["code"] as dynamic,
      json["name"] as String,
    );
  }
}

class ActivePolicy{
  dynamic code;
  dynamic name;

  ActivePolicy(this.code, this.name);

  factory ActivePolicy.fromJson(Map<String, dynamic> json){
    return ActivePolicy(
      json["code"] as dynamic,
      json["name"] as dynamic,
    );
  }
}

class Profile{
  String code;
  dynamic name;
  Policy policy;

  Profile(this.code, this.name, this.policy);

  factory Profile.fromJson(Map<String, dynamic> json){
    return Profile(
      json["code"] as String,
      json["name"] as dynamic,
      Policy.fromJson(json["policy"]),
    );
  }
}

class Policy{
  String code;
  dynamic name;

  Policy(this.code, this.name);

  factory Policy.fromJson(Map<String, dynamic> json){
    return Policy(
        json["code"] as String,
        json["name"] as dynamic
    );
  }
}

class Telephony{
  bool networkRoaming;
  dynamic simOperator;
  dynamic networkOperatorName;
  dynamic msisdn;
  dynamic simState;
  dynamic simserialNumber;

  Telephony(this.networkRoaming, this.simOperator, this.networkOperatorName,
      this.msisdn, this.simState, this.simserialNumber);

  factory Telephony.fromJson(Map<String, dynamic> json){
    return Telephony(
        json["networkRoaming"] as bool,
        json["simOperator"] as dynamic,
        json["networkOperatorName"] as dynamic,
        json["msisdn"] as dynamic,
        json["simState"] as dynamic,
        json["simserialNumber"] as dynamic
    );
  }
}

class Wifi{

  dynamic leaseDuration;
  dynamic mtu;
  dynamic dns1;
  dynamic dns2;
  dynamic networkType;
  dynamic currentWifiApnSsid;
  bool currentWifiApnHiddenSsid;
  dynamic gateway;
  dynamic server;
  dynamic netmask;
  String ip;

  Wifi(
      this.leaseDuration,
      this.mtu,
      this.dns1,
      this.dns2,
      this.networkType,
      this.currentWifiApnSsid,
      this.currentWifiApnHiddenSsid,
      this.gateway,
      this.server,
      this.netmask,
      this.ip);

  factory Wifi.fromJson(Map<String, dynamic> json){

    return Wifi(
      json["leaseDuration"] as dynamic,
      json["mtu"] as dynamic,
      json["dns1"] as dynamic,
      json["dns2"] as dynamic,
      json["networkType"] as dynamic,
      json["currentWifiApnSsid"] as dynamic,
      json["currentWifiApnHiddenSsid"] as bool,
      json["gateway"] as dynamic,
      json["server"] as dynamic,
      json["netmask"] as dynamic,
      json["ip"] as String,
    );
  }
}

class Page{
  int size;
  int totalElements;
  int totalPages;
  int number;

  Page(this.size, this.totalElements, this.totalPages, this.number);

  factory Page.fromJson(Map<String, dynamic> json){
    return Page(
        json["size"] as int,
        json["totalElements"] as int,
        json["totalPages"] as int,
        json["number"] as int
    );
  }
}