class ErrorResponseUnauthorized {
  String error;
  String errorDescription;

  ErrorResponseUnauthorized(this.error, this.errorDescription);

  factory ErrorResponseUnauthorized.fromJson(Map<String, dynamic> json) {
    return ErrorResponseUnauthorized(
      json["error"] as String,
      json["error_description"] as String,
    );
  }
}
