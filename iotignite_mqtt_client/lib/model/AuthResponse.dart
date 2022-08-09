class AuthResponse {
  String access_token;
  String token_type;
  String refresh_token;
  int expires_in;
  String scope;
  String error;
  String error_description;

  AuthResponse(this.access_token, this.token_type, this.refresh_token,
      this.expires_in, this.scope, this.error, this.error_description);

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      json["access_token"] as String,
      json["token_type"] as String,
      json["refresh_token"] as String,
      json["expires_in"] as int,
      json["scope"] as String,
      json["error"] as String,
      json["error_description"] as String,
    );
  }
}
