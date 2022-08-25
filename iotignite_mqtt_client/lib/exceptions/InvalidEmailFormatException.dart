class InvalidEmailFormatException implements Exception {
  String errMessage;
  int errorCode;

  InvalidEmailFormatException(this.errMessage, this.errorCode);

  String getMessage() {
    return errMessage;
  }

  int errCode() {
    return errorCode;
  }
}
