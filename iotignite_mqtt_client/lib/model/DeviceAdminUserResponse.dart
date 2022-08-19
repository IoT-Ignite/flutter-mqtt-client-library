class DeviceAdminUserResponse {

  String username;
  String deviceId;

  DeviceAdminUserResponse(this.username, this.deviceId);

  factory DeviceAdminUserResponse.fromJson(Map<String, dynamic> json){
    return DeviceAdminUserResponse(
        json["username"] as String,
        json["deviceId"] as String
    );
  }
}