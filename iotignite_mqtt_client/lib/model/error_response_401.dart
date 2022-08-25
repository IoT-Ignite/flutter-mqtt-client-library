class ErrorResponse401 {

  String error;
  String error_description;

  ErrorResponse401(this.error, this.error_description);

  factory ErrorResponse401.fromJson(Map<String, dynamic> json) {
    return ErrorResponse401(
      json["error"] as String,
      json["error_description"] as String,
    );
  }
}
