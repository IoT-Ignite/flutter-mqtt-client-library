class InvalidEmailFormatException implements Exception {
  String errMessage;
  int errorCode;

  InvalidEmailFormatException(this.errMessage, this.errorCode);

  String getMessage() {
    return this.errMessage;
  }

  int errCode() {
    return this.errorCode;
  }
}
