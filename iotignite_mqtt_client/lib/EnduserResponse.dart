class EnduserResponse{

  List<Links> linksList;
  List<Contents> contentsList;
  Page page;

  EnduserResponse(this.linksList, this.contentsList, this.page);

  factory EnduserResponse.fromJson(Map<String, dynamic> json){

    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray.map((linkListJsonArrayObj) => Links.fromJson(linkListJsonArrayObj)).toList();

    var contentsJsonArray = json["content"] as List;
    List<Contents> contentList = contentsJsonArray.map((contentsJsonArrayObj) => Contents.fromJson(contentsJsonArrayObj)).toList();

    return EnduserResponse(linkList, contentList, Page.fromJson(json["page"]));
  }
}

class Links{

  String rel;
  String href;

  Links(this.rel, this.href);

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      json["rel"] as String,
      json["href"] as String,
    );
  }
}

class Page{

  int size;
  int totalElements;
  int totalPages;
  int number;

  Page(this.size, this.totalElements, this.totalPages, this.number);

  factory Page.fromJson(Map<String, dynamic> json){
    return Page(
        json["size"] as int,
        json["totalElements"] as int,
        json["totalPages"] as int,
        json["number"] as int
    );
  }
}

class Contents{

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

  Contents(
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

  factory Contents.fromJson(Map<String, dynamic> json){

    var linksJsonArray = json["links"] as List;
    List<Links> linksList = linksJsonArray.map((linksJsonArrayObj) => Links.fromJson(linksJsonArrayObj)).toList();

    return Contents(
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

class AdminArea{

  String code;
  String tenantDomain;
  String name;

  AdminArea(this.code, this.name, this.tenantDomain);

  factory AdminArea.fromJson(Map<String, dynamic> json){
    return AdminArea(
      json["code"] as String,
      json["name"] as String,
      json["tenantDomain"] as String,
    );
  }
}

class Profile{

  String code;
  dynamic name;
  Policy policy;

  Profile(this.code, this.name, this.policy);

  factory Profile.fromJson(Map<String, dynamic> json){
    return Profile(
      json["code"] as String,
      json["name"] as dynamic,
      Policy.fromJson(json["policy"]),
    );
  }
}

class Policy{

  String code;
  dynamic name;

  Policy(this.code, this.name);

  factory Policy.fromJson(Map<String, dynamic> json){
    return Policy(
        json["code"] as String,
        json["name"] as dynamic
    );
  }
}