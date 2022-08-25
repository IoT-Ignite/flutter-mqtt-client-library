import 'package:iotignite_mqtt_client/model/Links.dart';
import 'package:iotignite_mqtt_client/model/DeviceContent.dart';
import 'package:iotignite_mqtt_client/model/Page.dart';

class DeviceResponse{

  List<Links> links;
  List<DeviceContent> content;
  Page page;

  DeviceResponse(this.links, this.content, this.page);

  factory DeviceResponse.fromJson(Map<String, dynamic> json){

    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray.map((x) => Links.fromJson(x)).toList();

    var contentsJsonArray = json["content"] as List;
    List<DeviceContent> contentList = contentsJsonArray.map((y) => DeviceContent.fromJson(y)).toList();

    return DeviceResponse(
        linkList,
        contentList,
        Page.fromJson(json["page"])
    );
  }

  @override
  String toString() {
    return 'DeviceResponse{links: $links, content: $content, page: $page}';
  }
}