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

  @override
  String toString() {
    return 'HotspotConfig{ssid: $ssid, password: $password, security: $security}';
  }
}