import 'dart:ffi';
import 'dart:io';
import 'dart:async';

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

  String refreshGrantType = "refresh_token";
  String refreshToken;

  String token;

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

      print(resp.access_token);
    } else if (StatusCodes.BAD_REQUEST == answer.statusCode) {
      AuthResponse400 resp = AuthResponse400.fromJson(json.decode(answer.body));
      print(resp.error);
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

    } else if (StatusCodes.BAD_REQUEST == answer.statusCode) {
      AuthResponse400 resp = AuthResponse400.fromJson(json.decode(answer.body));
      print(resp.error);
    }
  }

  Timer RefreshToken(){
    return Timer.periodic(FIVE_MIN, (Timer t) => getRefreshToken());
  }
/*
  Future<String> getEndUser() async {
    var url = BASE_URL + "enduser";
    var answer =
    await http.get(url, headers: {"Authorization": "Bearer ${this.token}"});

    var jsonResponse = EndUserResponse.fromJson(json.decode(answer.body));

    if (answer.statusCode == 200) {
      return "Success! Mail: ${jsonResponse.contentsList[0].mail}"; //???
    } else if (answer.statusCode == 401) {
      return "Unauthorized";
    }
  }
*/
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


}
