import 'package:iotignite_mqtt_client/model/Links.dart';
import 'package:iotignite_mqtt_client/model/Page.dart';
import 'package:iotignite_mqtt_client/model/EnduserContent.dart';

class EndUserResponse {
  List<Links> linksList;
  List<EnduserContent> content;
  Page page;

  EndUserResponse(this.linksList, this.content, this.page);

  factory EndUserResponse.fromJson(Map<String, dynamic> json) {
    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray
        .map((linkListJsonArrayObj) => Links.fromJson(linkListJsonArrayObj))
        .toList();

    var contentsJsonArray = json["content"] as List;
    List<EnduserContent> contentList = contentsJsonArray
        .map((contentsJsonArrayObj) => EnduserContent.fromJson(contentsJsonArrayObj))
        .toList();

    return EndUserResponse(linkList, contentList, Page.fromJson(json["page"]));
  }

  @override
  String toString() {
    return 'EndUserResponse{linksList: $linksList, content: $content, page: $page}';
  }
}
