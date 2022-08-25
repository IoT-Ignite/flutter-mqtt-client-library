import 'package:iotignite_mqtt_client/model/links.dart';
import 'package:iotignite_mqtt_client/model/page.dart';
import 'package:iotignite_mqtt_client/model/sys_user_content.dart';

class SysUserResponse {
  List<Links> links;
  List<SysUserContent> content;
  Page page;

  SysUserResponse(this.links, this.content, this.page);

  factory SysUserResponse.fromJson(Map<String, dynamic> json) {
    var linkListJsonArray = json["links"] as List;
    List<Links> linkList =
        linkListJsonArray.map((x) => Links.fromJson(x)).toList();

    var contentsJsonArray = json["content"] as List;
    List<SysUserContent> contentList =
        contentsJsonArray.map((x) => SysUserContent.fromJson(x)).toList();

    return SysUserResponse(linkList, contentList, Page.fromJson(json["page"]));
  }

  @override
  String toString() {
    return 'SysUserResponse{links: $links, content: $content, page: $page}';
  }
}
