import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:email_validator/email_validator.dart';

class TokenAuthentication{

  String username;
  String password;
  String grantType= "password";
  bool autoRefreshToken;

  TokenAuthentication(this.username, this.password, this.autoRefreshToken);

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
    var jsonResponse = TokenResponse.fromJson(json.decode(answer.body));

    if(answer.statusCode == 200){
      // If the server did return a 200 OK response
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
}

class TokenResponse{

  String access_token;
  String token_type;
  String refresh_token;
  int expires_in;
  String scope;
  String error;
  String error_description;

  TokenResponse(this.access_token, this.token_type, this.refresh_token,
      this.expires_in, this.scope, this.error, this.error_description);

  factory TokenResponse.fromJson(Map<String, dynamic> json){
    return TokenResponse(
        json["access_token"] as String,
        json["token_type"] as String,
        json["refresh_token"] as String,
        json["expires_in"] as int,
        json["scope"] as String,
        json["error"] as String,
        json["error_description"] as String,
    );
  }
}


