import 'package:iotignite_mqtt_client/model/Links.dart';
import 'package:iotignite_mqtt_client/model/Page.dart';
import 'package:iotignite_mqtt_client/model/SyuserContent.dart';

class SyuserResponse{

  List<Links> links;
  List<SyuserContent> content;
  Page page;

  SyuserResponse(this.links, this.content, this.page);

  factory SyuserResponse.fromJson(Map<String, dynamic> json){

    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray.map((x) => Links.fromJson(x)).toList();

    var contentsJsonArray = json["content"] as List;
    List<SyuserContent> contentList = contentsJsonArray.map((x) => SyuserContent.fromJson(x)).toList();

    return SyuserResponse(linkList, contentList, Page.fromJson(json["page"]));
  }

  @override
  String toString() {
    return 'SyuserResponse{links: $links, content: $content, page: $page}';
  }
}




