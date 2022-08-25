class ErrorResponseUnauthorized {
  String error;
  String error_description;

  ErrorResponseUnauthorized(this.error, this.error_description);

  factory ErrorResponseUnauthorized.fromJson(Map<String, dynamic> json) {
    return ErrorResponseUnauthorized(
      json["error"] as String,
      json["error_description"] as String,
    );
  }
}
