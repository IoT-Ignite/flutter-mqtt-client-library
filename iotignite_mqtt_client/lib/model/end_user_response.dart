import 'package:iotignite_mqtt_client/model/links.dart';
import 'package:iotignite_mqtt_client/model/pages.dart';
import 'package:iotignite_mqtt_client/model/end_user_content.dart';

class EndUserResponse {
  List<Links> linksList;
  List<EndUserContent> content;
  Pages page;

  EndUserResponse(this.linksList, this.content, this.page);

  factory EndUserResponse.fromJson(Map<String, dynamic> json) {
    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray
        .map((linkListJsonArrayObj) => Links.fromJson(linkListJsonArrayObj))
        .toList();

    var contentsJsonArray = json["content"] as List;
    List<EndUserContent> contentList = contentsJsonArray
        .map((contentsJsonArrayObj) =>
            EndUserContent.fromJson(contentsJsonArrayObj))
        .toList();

    return EndUserResponse(linkList, contentList, Pages.fromJson(json["page"]));
  }

  @override
  String toString() {
    return 'EndUserResponse{linksList: $linksList, content: $content, page: $page}';
  }
}
