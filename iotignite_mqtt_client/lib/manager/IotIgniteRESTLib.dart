import 'dart:ffi';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:iotignite_mqtt_client/exceptions/InvalidEmailFormatException.dart';
import 'dart:convert';
import 'package:iotignite_mqtt_client/model/AuthResponse.dart';
import 'package:iotignite_mqtt_client/model/EndUserResponse.dart';
import 'package:iotignite_mqtt_client/utils/Constants.dart';

class IotIgniteRESTLib {
  String username;
  String password;
  String grantType = "password";
  bool autoRefreshToken;

  String token;

  static IotIgniteRESTLib _singleInstance;

  IotIgniteRESTLib._(this.username, this.password, this.autoRefreshToken);

  static IotIgniteRESTLib getInstance(username, password, autoRefresh) {
    if (_singleInstance == null) {
      if (!EmailValidator.validate(username)) {
        // throw format error.
        throw InvalidEmailFormatException("Mail format is invalid", 508);
      }
      _singleInstance = IotIgniteRESTLib._(username, password, autoRefresh);
    }

    return _singleInstance;
  }

  Future<Void> Auth() async {
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
      AuthResponse resp = AuthResponse.fromJson(json.decode(answer.body));
      print(resp.access_token);
    } else if (StatusCodes.BAD_REQUEST = answer.statusCode) {
      AuthResponse resp = AuthResponse.fromJson(json.decode(answer.body));
      print(resp.error);
// hatayı jsonı parse ET
    }


    if (answer.statusCode == 200) {
      // If the server did return a 200 OK response
      this.token = jsonResponse.access_token;
    } else if (answer.statusCode == 400) {
      // If the server did return a 200 Bad Request response

    }
  }

/*  Future<String> getAppKey() async {
    var url = "https://api.ardich.com/api/v3/settings/messager/appkey";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer ${this.token}"});

    var jsonResponse =
        SettingsMessagerAppKeyResponse.fromJson(json.decode(answer.body));

    if (answer.statusCode == 200) {
      return "Success! Appkey: ${jsonResponse.appkey}";
    } else if (answer.statusCode == 401) {
      return "Unauthorized";
    }
  }*/

  Future<String> getEndUser() async {
    var url = "https://api.ardich.com/api/v3/enduser";
    var answer =
        await http.get(url, headers: {"Authorization": "Bearer ${this.token}"});

    var jsonResponse = EndUserResponse.fromJson(json.decode(answer.body));

    if (answer.statusCode == 200) {
      return "Success! Mail: ${jsonResponse.contentsList[0].mail}"; //???
    } else if (answer.statusCode == 401) {
      return "Unauthorized";
    }
  }
}
