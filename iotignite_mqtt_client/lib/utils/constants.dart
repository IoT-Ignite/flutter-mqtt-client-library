const String BASE_URL = "https://api.ardich.com/api/v3/";

/*
class DeviceParams {
  static String DEVICE = "829502c33adc4e95986fe6789717fa68";  // or "3296d391c42d4ef0a128318054d1db98"
  static String NODE_ID = "DHT22NODE";
  static String SENSOR_ID = "DHT22 Humidity Sensor";  // or "DHT22 Temperature Sensor"
}
*/
class StatusCodes {
  static int SUCCESS = 200;
  static int BAD_REQUEST = 400;
  static int UNAUTHORIZED = 401;
  static int FORBIDDEN = 403;
  static int NOT_FOUND = 404;
  static int INTERNAL_SERVER_ERROR = 500;
}

const FIVE_MIN = const Duration(minutes: 5);

const bool DEBUG = false;
