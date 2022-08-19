class AppKeyResponse{

  String appkey;
  bool enabled;
  List<dynamic> links;

  AppKeyResponse(this.appkey, this.enabled, this.links);

  factory AppKeyResponse.fromJson(Map<String, dynamic> json){
    return AppKeyResponse(
      json["appkey"] as String,
      json["enabled"] as bool,
      json["links"] as List,
    );
  }
}