library iotignite_mqtt_client;

import 'dart:convert'; // for json parse
import 'package:http/http.dart' as http;
import 'package:iotignite_mqtt_client/Datas.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

Datas datasParse(String ans){

  return Datas.fromJson(json.decode(ans));

}

Future<Datas> allDatas() async{
  var url = "https://api.github.com/users/xemeriusss";
  var ans = await http.get(url);
  return datasParse(ans.body);
}


