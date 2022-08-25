class AuthResponseSuccess {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;

  AuthResponseSuccess(this.accessToken, this.tokenType, this.refreshToken,
      this.expiresIn, this.scope);

  factory AuthResponseSuccess.fromJson(Map<String, dynamic> json) {
    return AuthResponseSuccess(
      json["access_token"] as String,
      json["token_type"] as String,
      json["refresh_token"] as String,
      json["expires_in"] as int,
      json["scope"] as String,
    );
  }
}
