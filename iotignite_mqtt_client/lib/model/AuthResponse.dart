class AuthResponse200 {
  String access_token;
  String token_type;
  String refresh_token;
  int expires_in;
  String scope;

  AuthResponse200(this.access_token, this.token_type, this.refresh_token,
      this.expires_in, this.scope);

  factory AuthResponse200.fromJson(Map<String, dynamic> json) {
    return AuthResponse200(
      json["access_token"] as String,
      json["token_type"] as String,
      json["refresh_token"] as String,
      json["expires_in"] as int,
      json["scope"] as String,
    );
  }
}

