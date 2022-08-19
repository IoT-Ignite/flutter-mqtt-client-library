class EndUserResponse {
  List<Links> linksList;
  List<Content> content;
  Page page;

  EndUserResponse(this.linksList, this.content, this.page);

  factory EndUserResponse.fromJson(Map<String, dynamic> json) {
    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray
        .map((linkListJsonArrayObj) => Links.fromJson(linkListJsonArrayObj))
        .toList();

    var contentsJsonArray = json["content"] as List;
    List<Content> contentList = contentsJsonArray
        .map((contentsJsonArrayObj) => Content.fromJson(contentsJsonArrayObj))
        .toList();

    return EndUserResponse(linkList, contentList, Page.fromJson(json["page"]));
  }
}

class Links {
  String rel;
  String href;

  Links(this.rel, this.href);

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      json["rel"] as String,
      json["href"] as String,
    );
  }
}

class Page {
  int size;
  int totalElements;
  int totalPages;
  int number;

  Page(this.size, this.totalElements, this.totalPages, this.number);

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(json["size"] as int, json["totalElements"] as int,
        json["totalPages"] as int, json["number"] as int);
  }
}

class Content {
  String mail;
  String firstName;
  String lastName;
  String identityNo;
  bool enabled;
  AdminArea adminArea;
  Profile profile;
  List<Links> links;
  String code;
  String activationCode;
  bool activated;
  int createdDate;
  int activationDate;

  Content(
      this.mail,
      this.firstName,
      this.lastName,
      this.identityNo,
      this.enabled,
      this.adminArea,
      this.profile,
      this.links,
      this.code,
      this.activationCode,
      this.activated,
      this.createdDate,
      this.activationDate);

  factory Content.fromJson(Map<String, dynamic> json) {
    var linksJsonArray = json["links"] as List;
    List<Links> linksList = linksJsonArray
        .map((linksJsonArrayObj) => Links.fromJson(linksJsonArrayObj))
        .toList();

    return Content(
      json["mail"] as String,
      json["firstName"] as String,
      json["lastName"] as String,
      json["identityNo"] as String,
      json["enabled"] as bool,
      AdminArea.fromJson(json["adminArea"]),
      Profile.fromJson(json["profile"]),
      linksList,
      json["code"] as String,
      json["activationCode"] as String,
      json["activated"] as bool,
      json["createdDate"] as int,
      json["activationDate"] as int,
    );
  }
}

class AdminArea {
  String code;
  String tenantDomain;
  String name;

  AdminArea(this.code, this.name, this.tenantDomain);

  factory AdminArea.fromJson(Map<String, dynamic> json) {
    return AdminArea(
      json["code"] as String,
      json["name"] as String,
      json["tenantDomain"] as String,
    );
  }
}

class Profile {
  String code;
  dynamic name;
  Policy policy;

  Profile(this.code, this.name, this.policy);

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      json["code"] as String,
      json["name"] as dynamic,
      Policy.fromJson(json["policy"]),
    );
  }
}

class Policy {
  String code;
  dynamic name;

  Policy(this.code, this.name);

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(json["code"] as String, json["name"] as dynamic);
  }
}
