import 'package:iotignite_mqtt_client/model/Telephony.dart';
import 'package:iotignite_mqtt_client/model/Wifi.dart';
import 'package:iotignite_mqtt_client/model/Bluetooth.dart';

class Network{
  Telephony telephony;
  Wifi wifi;
  Bluetooth bluetooth;

  Network(this.telephony, this.wifi, this.bluetooth);

  factory Network.fromJson(Map<String, dynamic> json){
    return Network(
      json["telephony"] == null ? null : Telephony.fromJson(json["telephony"]),
      json["wifi"] == null ? null : Wifi.fromJson(json["wifi"]),
      json["bluetooth"] == null ? null : Bluetooth.fromJson(json["bluetooth"]),
    );
  }

  @override
  String toString() {
    return 'Network{telephony: $telephony, wifi: $wifi, bluetooth: $bluetooth}';
  }
}