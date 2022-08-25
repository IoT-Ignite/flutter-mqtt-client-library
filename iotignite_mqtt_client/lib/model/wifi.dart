class Wifi{

  String leaseDuration;
  String mtu;
  String dns1;
  String dns2;
  String networkType;
  String currentWifiApnSsid;
  bool currentWifiApnHiddenSsid;
  String gateway;
  String server;
  String netmask;
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

  @override
  String toString() {
    return 'Wifi{leaseDuration: $leaseDuration, mtu: $mtu, dns1: $dns1, dns2: $dns2, networkType: $networkType, currentWifiApnSsid: $currentWifiApnSsid, currentWifiApnHiddenSsid: $currentWifiApnHiddenSsid, gateway: $gateway, server: $server, netmask: $netmask, ip: $ip}';
  }

  factory Wifi.fromJson(Map<String, dynamic> json){

    return Wifi(
      json["leaseDuration"] as String,
      json["mtu"] as String,
      json["dns1"] as String,
      json["dns2"] as String,
      json["networkType"] as String,
      json["currentWifiApnSsid"] as String,
      json["currentWifiApnHiddenSsid"] as bool,
      json["gateway"] as String,
      json["server"] as String,
      json["netmask"] as String,
      json["ip"] as String,
    );
  }
}