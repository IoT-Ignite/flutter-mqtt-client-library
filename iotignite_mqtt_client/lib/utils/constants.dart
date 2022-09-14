const String BASE_URL = "https://api.ardich.com/api/v3/";

class StatusCodes {
  static int SUCCESS = 200;
  static int BAD_REQUEST = 400;
  static int UNAUTHORIZED = 401;
  static int FORBIDDEN = 403;
  static int NOT_FOUND = 404;
  static int INTERNAL_SERVER_ERROR = 500;
}

const TWO_MIN = Duration(minutes: 2);

const bool DEBUG = false;
