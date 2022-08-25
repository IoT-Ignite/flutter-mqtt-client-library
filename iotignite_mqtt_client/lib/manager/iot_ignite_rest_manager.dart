import 'dart:ffi';
import 'dart:io';
import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:iotignite_mqtt_client/exceptions/InvalidEmailFormatException.dart';
import 'package:iotignite_mqtt_client/model/AppKeyResponse.dart';
import 'dart:convert';
import 'package:iotignite_mqtt_client/model/AuthResponse.dart';
import 'package:iotignite_mqtt_client/model/DeviceAdminUserResponse.dart';
import 'package:iotignite_mqtt_client/model/DeviceResponse.dart';
import 'package:iotignite_mqtt_client/model/DeviceSummaryResponse.dart';
import 'package:iotignite_mqtt_client/model/EndUserResponse.dart';
import 'package:iotignite_mqtt_client/model/NodeInventoryResponse.dart';
import 'package:iotignite_mqtt_client/model/ProfilePoliciesResponse.dart';
import 'package:iotignite_mqtt_client/model/SensorDataHistoryResponse.dart';
import 'package:iotignite_mqtt_client/model/SensorDataResponse.dart';
import 'package:iotignite_mqtt_client/model/SyuserAuditorResponse.dart';
import 'package:iotignite_mqtt_client/model/SyuserResponse.dart';
import 'package:iotignite_mqtt_client/utils/Constants.dart';
import 'package:iotignite_mqtt_client/model/ErrorResponse401.dart';
import 'package:iotignite_mqtt_client/model/ErrorResponse403.dart';
import 'package:iotignite_mqtt_client/model/ErrorResponse404.dart';
import 'package:iotignite_mqtt_client/model/ErrorResponse500.dart';

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

  Future<void> Auth() async {
    var url = Uri.parse(BASE_URL + "oauth/token");
    var data = {
      "grant_type": this.grantType,
      "username": this.username,
      "password": this.password
    };

      var answer = await http.post(
        url,
        body: data,
        headers: {
          "Authorization": "Basic ZnJvbnRlbmQ6",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

    print("return code=${answer.statusCode}");

    if (StatusCodes.SUCCESS == answer.statusCode) {
      AuthResponse200 resp = AuthResponse200.fromJson(json.decode(answer.body));

      this.refreshToken = resp.refresh_token; // for the first time to pass to getRefreshToken()
      this.token = resp.access_token; // to send to other functions for authorization
      print(resp.access_token);
    } else if (StatusCodes.BAD_REQUEST == answer.statusCode) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> getRefreshToken() async{
    var url = Uri.parse(BASE_URL + "oauth/token");
    var data = {
      "grant_type": this.refreshGrantType,
      "refresh_token": this.refreshToken,
    };

    var answer = await http.post(
      url,
      body: data,
      headers: {
        "Authorization": "Basic ZnJvbnRlbmQ6",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    print("return code=${answer.statusCode}");

    if (StatusCodes.SUCCESS == answer.statusCode) {
      AuthResponse200 resp = AuthResponse200.fromJson(json.decode(answer.body));
      print(resp.access_token);

      this.refreshToken = resp.refresh_token; // to constantly renew
      this.token = resp.access_token;

    } else if (StatusCodes.BAD_REQUEST == answer.statusCode) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Timer RefreshToken(){
    return Timer.periodic(FIVE_MIN, (Timer t) => getRefreshToken());
  }

  Future<void> getEndUser() async {
    var url = BASE_URL + "enduser";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      EndUserResponse resp = EndUserResponse.fromJson(json.decode(answer.body));
      print("getEndUser() ${resp.content[0].mail} , ${resp.content[0].firstName} , ${resp.content[0].lastName}");

    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> getAppKey() async {
    var url = BASE_URL + "settings/messager/appkey";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      AppKeyResponse resp = AppKeyResponse.fromJson(json.decode(answer.body));
      print("getAppKey() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> getSysUserInfo() async {
    var url = BASE_URL + "sysuser/auditor";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SyuserAuditorResponse resp = SyuserAuditorResponse.fromJson(json.decode(answer.body));
      print("getSysUserInfo() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> isUserExists() async {
    var url = BASE_URL + "sysuser";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SyuserResponse resp = SyuserResponse.fromJson(json.decode(answer.body));
      print("isUserExists() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> getDeviceInfo() async {
    var url = BASE_URL + "device";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      DeviceResponse resp = DeviceResponse.fromJson(json.decode(answer.body));
      print("getDeviceInfo() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> getDeviceSummary() async {
    var url = BASE_URL + "device/summary";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      DeviceSummaryResponse resp = DeviceSummaryResponse.fromJson(json.decode(answer.body));
      print("getDeviceSummary() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> getDeviceNodeInventory(String device) async {

    var url = BASE_URL + "device/$device/device-node-inventory";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      NodeInventoryResponse resp = NodeInventoryResponse.fromJson(json.decode(answer.body));
      print("getDeviceNodeInventory() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponse403 resp = ErrorResponse403.fromJson(json.decode(answer.body));
      print(resp.message);
    } else if (answer.statusCode == StatusCodes.NOT_FOUND) {
      ErrorResponse404 resp = ErrorResponse404.fromJson(json.decode(answer.body));
      print(resp.message);
    }
  }

  Future<void> getLastData(String device, String node_id, String sensor_id) async {
    var url = BASE_URL + "device/${device}/sensor-data?"
        "nodeId=${node_id}&sensorId=${sensor_id}";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SensorDataResponse resp = SensorDataResponse.fromJson(json.decode(answer.body));
      print("getLastData() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponse403 resp = ErrorResponse403.fromJson(json.decode(answer.body));
      print(resp.message);
    } else if (answer.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
      ErrorResponse500 resp = ErrorResponse500.fromJson(json.decode(answer.body));
      print(resp.message);
    }
  }

  Future<void> getThingDataHistory(String device, String node_id, String sensor_id) async {
    var url = BASE_URL + "device/${device}/sensor-data-history?"
        "nodeId=${node_id}&sensorId=${sensor_id}";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      SensorDataHistoryResponse resp = SensorDataHistoryResponse.fromJson(json.decode(answer.body));
      print("getThingDataHistory() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    }
  }

  Future<void> getMqttUser(String device) async {
    var url = BASE_URL + "device-admin/user/$device";
    var answer =  await http.get(
        url,
        headers: {"Authorization": "Bearer $token"}
    );

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      DeviceAdminUserResponse resp = DeviceAdminUserResponse.fromJson(json.decode(answer.body));
      print("getMqttUser() ${resp}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse401 resp = ErrorResponse401.fromJson(json.decode(answer.body));
      print(resp.error_description);
    } else if (answer.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
      ErrorResponse500 resp = ErrorResponse500.fromJson(json.decode(answer.body));
      print(resp.message);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponse403 resp = ErrorResponse403.fromJson(json.decode(answer.body));
      print(resp.message);
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

    print("return code=${answer.statusCode}");

    if (answer.statusCode == StatusCodes.SUCCESS) {
      ProfilePoliciesResponse resp = ProfilePoliciesResponse.fromJson(json.decode(answer.body));
      print("getProfilePolicies() ${resp.policyProfile.name} ,  ${resp.code}");
    } else if (answer.statusCode == StatusCodes.UNAUTHORIZED) {
      ErrorResponse resp = ErrorResponse.fromJson(json.decode(answer.body));
      print(resp.error_description);
    } else if (answer.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
      ErrorResponse500 resp = ErrorResponse500.fromJson(json.decode(answer.body));
      print(resp.message);
    } else if (answer.statusCode == StatusCodes.FORBIDDEN) {
      ErrorResponse403 resp = ErrorResponse403.fromJson(json.decode(answer.body));
      print(resp.message);
    } else if (answer.statusCode == StatusCodes.NOT_FOUND) {
      print("null");
    }
  }
*/

}


