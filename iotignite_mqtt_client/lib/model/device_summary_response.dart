import 'package:iotignite_mqtt_client/model/links.dart';
import 'package:iotignite_mqtt_client/model/device_content.dart';
import 'package:iotignite_mqtt_client/model/pages.dart';

class DeviceSummaryResponse {
  List<Links> links;
  List<DeviceContent> content;
  Pages page;

  DeviceSummaryResponse(this.links, this.content, this.page);

  factory DeviceSummaryResponse.fromJson(Map<String, dynamic> json) {
    var linkListJsonArray = json["links"] as List;
    List<Links> linkList =
        linkListJsonArray.map((x) => Links.fromJson(x)).toList();

    var contentsJsonArray = json["content"] as List;
    List<DeviceContent> contentList =
        contentsJsonArray.map((y) => DeviceContent.fromJson(y)).toList();

    return DeviceSummaryResponse(
        linkList, contentList, Pages.fromJson(json["page"]));
  }

  @override
  String toString() {
    return 'DeviceSummaryResponse{links: $links, content: $content, page: $page}';
  }
}
