import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:iotignite_mqtt_client/exceptions/invalid_email_format_exception.dart';
import 'package:iotignite_mqtt_client/model/app_key_response.dart';
import 'dart:convert';
import 'package:iotignite_mqtt_client/model/auth_response.dart';
import 'package:iotignite_mqtt_client/model/device_admin_user_response.dart';
import 'package:iotignite_mqtt_client/model/device_response.dart';
import 'package:iotignite_mqtt_client/model/device_summary_response.dart';
import 'package:iotignite_mqtt_client/model/end_user_response.dart';
import 'package:iotignite_mqtt_client/model/node_inventory_response.dart';
import 'package:iotignite_mqtt_client/model/sensor_data_history_response.dart';
import 'package:iotignite_mqtt_client/model/sensor_data_response.dart';
import 'package:iotignite_mqtt_client/model/sys_user_auditor_response.dart';
import 'package:iotignite_mqtt_client/model/sys_user_response.dart';
import 'package:iotignite_mqtt_client/utils/constants.dart';
import 'package:iotignite_mqtt_client/model/error_response_unauthorized.dart';
import 'package:iotignite_mqtt_client/model/error_response_forbidden.dart';
import 'package:iotignite_mqtt_client/model/error_response_not_found.dart';
import 'package:iotignite_mqtt_client/model/error_response_internal_server.dart';
import 'package:iotignite_mqtt_client/utils/utility_functions.dart';

class IotIgniteRESTLib {
  String username;
  String password;
  String grantType = "password";
  bool autoRefreshToken;

  String refreshGrantType = "refresh_token";
  String refreshToken;

  String token; // for use in other functions

  static IotIgniteRESTLib _singleInstance;

  IotIgniteRESTLib._(this.username, this.password, this.autoRefreshToken);

  // to make singleton object
  static IotIgniteRESTLib getInstance(username, password, autoRefresh) {
    // first time taking the object
    if (_singleInstance == null) {
      if (!EmailValidator.validate(username)) {
        // throw format error
        throw InvalidEmailFormatException("Mail format is invalid", 422);
      }
      _singleInstance = IotIgniteRESTLib._(username, password, autoRefresh);
    }

    return _singleInstance;
  }

  Future<void> auth() async {
    var url = Uri.parse(BASE_URL + "oauth/token");
    var data = {
      "grant_type": grantType,
      "username": username,
      "password": password
    };

    var answer = await http.post(
      url,
      body: data,
      headers: {
        "Authorization": "Basic ZnJvbnRlbmQ6",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    debugPrint("return code=${answer.statusCode}");

    if (StatusCodes.SUCCESS == answer.statusCode) {
      AuthResponseSuccess resp =
          AuthResponseSuccess.fromJson(json.decode(answer.body));

      refreshToken =
          resp.refreshToken; // for the first time to pass to getRefreshToken()
      token = resp.accessToken; // to send to other functions for authorization
      debugPrint(resp.accessToken);
    } else if (StatusCodes.BAD_REQUEST == answer.statusCode) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> getRefreshToken() async {
    var url = Uri.parse(BASE_URL + "oauth/token");
    var data = {
      "grant_type": refreshGrantType,
      "refresh_token": refreshToken,
    };

    var answer = await http.post(
      url,
      body: data,
      headers: {
        "Authorization": "Basic ZnJvbnRlbmQ6",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    debugPrint("return code=${answer.statusCode}");

    if (StatusCodes.SUCCESS == answer.statusCode) {
      AuthResponseSuccess resp =
          AuthResponseSuccess.fromJson(json.decode(answer.body));

      debugPrint(resp.accessToken);

      refreshToken = resp.refreshToken; // to constantly renew
      token = resp.accessToken;
    } else if (StatusCodes.BAD_REQUEST == answer.statusCode) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Timer RefreshToken() {
    return Timer.periodic(FIVE_MIN, (Timer t) => getRefreshToken());
  }

  Future<void> getEndUser() async {
    var url = BASE_URL + "enduser";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      EndUserResponse resp = EndUserResponse.fromJson(json.decode(answer.body));
      debugPrint(
          "getEndUser() ${resp.content[0].mail} , ${resp.content[0].firstName} , ${resp.content[0].lastName}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> getAppKey() async {
    var url = BASE_URL + "settings/messager/appkey";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      AppKeyResponse resp = AppKeyResponse.fromJson(json.decode(answer.body));
      debugPrint("getAppKey() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> getSysUserInfo() async {
    var url = BASE_URL + "sysuser/auditor";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SysUserAuditorResponse resp =
          SysUserAuditorResponse.fromJson(json.decode(answer.body));
      debugPrint("getSysUserInfo() $resp");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> isUserExists() async {
    var url = BASE_URL + "sysuser";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SysUserResponse resp = SysUserResponse.fromJson(json.decode(answer.body));
      debugPrint("isUserExists() $resp");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> getDeviceInfo() async {
    var url = BASE_URL + "device";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      DeviceResponse resp = DeviceResponse.fromJson(json.decode(answer.body));
      debugPrint("getDeviceInfo() $resp");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> getDeviceSummary() async {
    var url = BASE_URL + "device/summary";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      DeviceSummaryResponse resp =
          DeviceSummaryResponse.fromJson(json.decode(answer.body));
      debugPrint("getDeviceSummary() $resp");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> getDeviceNodeInventory(String device) async {
    var url = BASE_URL + "device/$device/device-node-inventory";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      NodeInventoryResponse resp =
          NodeInventoryResponse.fromJson(json.decode(answer.body));
      debugPrint("getDeviceNodeInventory() $resp");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponseForbidden resp =
          ErrorResponseForbidden.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    } else if (answer.statusCode == StatusCodes.NOT_FOUND) {
      ErrorResponseNotFound resp =
          ErrorResponseNotFound.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    }
  }

  Future<void> getLastData(
      String device, String node_id, String sensor_id) async {
    var url = BASE_URL +
        "device/${device}/sensor-data?"
            "nodeId=${node_id}&sensorId=${sensor_id}";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SensorDataResponse resp =
          SensorDataResponse.fromJson(json.decode(answer.body));
      debugPrint("getLastData() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponseForbidden resp =
          ErrorResponseForbidden.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    } else if (answer.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
      ErrorResponseInternalServer resp =
          ErrorResponseInternalServer.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    }
  }

  Future<void> getThingDataHistory(
      String device, String node_id, String sensor_id) async {
    var url = BASE_URL +
        "device/${device}/sensor-data-history?"
            "nodeId=${node_id}&sensorId=${sensor_id}";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SensorDataHistoryResponse resp =
          SensorDataHistoryResponse.fromJson(json.decode(answer.body));
      debugPrint("getThingDataHistory() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    }
  }

  Future<void> getMqttUser(String device) async {
    var url = BASE_URL + "device-admin/user/$device";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      DeviceAdminUserResponse resp =
          DeviceAdminUserResponse.fromJson(json.decode(answer.body));
      debugPrint("getMqttUser() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponseUnauthorized resp =
          ErrorResponseUnauthorized.fromJson(json.decode(answer.body));
      debugPrint(resp.errorDescription);
    } else if (answer.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
      ErrorResponseInternalServer resp =
          ErrorResponseInternalServer.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponseForbidden resp =
          ErrorResponseForbidden.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    }
  }

  // ERROR
/*
  Future<void> getProfilePolicies(String code) async {
    var url = BASE_URL + "profile/$code/policies";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    debugPrint("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      ProfilePoliciesResponse resp = ProfilePoliciesResponse.fromJson(json.decode(answer.body));
      debugPrint("getProfilePolicies() ${resp.policyProfile.name} ,  ${resp.code}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse resp = ErrorResponse.fromJson(json.decode(answer.body));
      debugPrint(resp.error_description);
    } else if (answer.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
      ErrorResponse500 resp = ErrorResponse500.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponse403 resp = ErrorResponse403.fromJson(json.decode(answer.body));
      debugPrint(resp.message);
    } else if (answer.statusCode == StatusCodes.NOT_FOUND) {
      debugPrint("null");
    }
  }
*/

}
