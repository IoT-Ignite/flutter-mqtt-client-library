class DeviceAdminUserResponse {
  String username;
  String deviceId;

  DeviceAdminUserResponse(this.username, this.deviceId);

  @override
  String toString() {
    return 'DeviceAdminUserResponse{username: $username, deviceId: $deviceId}';
  }

  factory DeviceAdminUserResponse.fromJson(Map<String, dynamic> json){
    return DeviceAdminUserResponse(
        json["username"] as String,
        json["deviceId"] as String
    );
  }
}