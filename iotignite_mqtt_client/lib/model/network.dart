import 'package:iotignite_mqtt_client/model/telephony.dart';
import 'package:iotignite_mqtt_client/model/wifi.dart';
import 'package:iotignite_mqtt_client/model/bluetooth.dart';

class Network {
  Telephony telephony;
  Wifi wifi;
  Bluetooth bluetooth;

  Network(this.telephony, this.wifi, this.bluetooth);

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      json["telephony"] == null ? Telephony(
          false, "", "", [], "", []
      ) : Telephony.fromJson(json["telephony"]),
      json["wifi"] == null ? Wifi(
          "", "", "", "", "", "", false, "", "", "", ""
      ) : Wifi.fromJson(json["wifi"]),
      json["bluetooth"] == null ? Bluetooth(
          "", [], false, []
      ) : Bluetooth.fromJson(json["bluetooth"]),
    );
  }

  @override
  String toString() {
    return 'Network{telephony: $telephony, wifi: $wifi, bluetooth: $bluetooth}';
  }
}
