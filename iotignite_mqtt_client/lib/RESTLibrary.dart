import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:iotignite_mqtt_client/AuthResponse.dart';
import 'package:iotignite_mqtt_client/EnduserResponse.dart';
import 'package:iotignite_mqtt_client/SettingsMessagerAppKeyResponse.dart';

class RESTLibrary{

  String username;
  String password;
  String grantType= "password";
  bool autoRefreshToken;

  String token;

  RESTLibrary(this.username, this.password, this.autoRefreshToken);

  Future<String> Auth() async{

    var url = Uri.parse("https://api.ardich.com/api/v3/oauth/token?grant_type=${this.grantType}&username=${this.username}&password=${this.password}");
    var data = {"grant_type":this.grantType, "username":this.username, "password":this.password};
    var answer = await http.post(url, body: data,
      headers: {
        "Authorization": "Basic ZnJvbnRlbmQ6",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    // parse the JSON
    var jsonResponse = AuthResponse.fromJson(json.decode(answer.body));

    if(answer.statusCode == 200){
      // If the server did return a 200 OK response
      this.token = jsonResponse.access_token;
      return "Success! Token: ${jsonResponse.access_token}";
    }
    else if(answer.statusCode == 400){
      // If the server did return a 200 Bad Request response

      if(this.username != "ardic.smart.office@gmail.com"){
        if(EmailValidator.validate(this.username) != true) {
          return "Please write in email format.";
        } else {
          return "Wrong username...";
        }
      } else if(this.password != "w1cm2ardc"){
        return "Wrong password...";
      }

      return jsonResponse.error_description;
    }
  }

  Future<String> getAppKey() async {
    var url = "https://api.ardich.com/api/v3/settings/messager/appkey";
    var answer = await http.get(url, headers: {"Authorization": "Bearer ${this.token}"});

    var jsonResponse = SettingsMessagerAppKeyResponse.fromJson(json.decode(answer.body));

    if (answer.statusCode == 200) {
      return "Success! Appkey: ${jsonResponse.appkey}";
    } else if(answer.statusCode == 401){
      return "Unauthorized";
    }
  }

  Future<String> getEndUser() async{

    var url = "https://api.ardich.com/api/v3/enduser";
    var answer = await http.get(url, headers: {"Authorization": "Bearer ${this.token}"});

    var jsonResponse = EnduserResponse.fromJson(json.decode(answer.body));

    if (answer.statusCode == 200) {
      return "Success! Mail: ${jsonResponse.contentsList[0].mail}"; //???
    } else if(answer.statusCode == 401){
      return "Unauthorized";
    }

  }

}



