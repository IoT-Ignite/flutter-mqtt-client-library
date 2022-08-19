class SyuserResponse{

  List<Links> links;
  List<Content> content;
  Page page;

  SyuserResponse(this.links, this.content, this.page);

  factory SyuserResponse.fromJson(Map<String, dynamic> json){

    var linkListJsonArray = json["links"] as List;
    List<Links> linkList = linkListJsonArray.map((x) => Links.fromJson(x)).toList();

    var contentsJsonArray = json["content"] as List;
    List<Content> contentList = contentsJsonArray.map((x) => Content.fromJson(x)).toList();

    return SyuserResponse(linkList, contentList, Page.fromJson(json["page"]));
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

class Content {

  String mail;
  String firstName;
  String lastName;
  bool enabled;
  int licenseCount;
  int licenseMonth;
  int trustAppSize;
  int trustUrlSize;
  int flowAppSize;
  int appStoreSize;
  int contentStoreSize;
  int flowProfilePolicySize;
  bool allDevicesAllowed;
  bool devicesWithoutDataGroupAllowed;
  List<dynamic> adminAreas;
  List<Roles> roles;
  List<dynamic> ipGroups;
  List<dynamic> links;
  String code;
  String lastModifiedDate;
  String createdDate;

  Content(
      this.mail,
      this.firstName,
      this.lastName,
      this.enabled,
      this.licenseCount,
      this.licenseMonth,
      this.trustAppSize,
      this.trustUrlSize,
      this.flowAppSize,
      this.appStoreSize,
      this.contentStoreSize,
      this.flowProfilePolicySize,
      this.allDevicesAllowed,
      this.devicesWithoutDataGroupAllowed,
      this.adminAreas,
      this.roles,
      this.ipGroups,
      this.links,
      this.code,
      this.lastModifiedDate,
      this.createdDate);

  factory Content.fromJson(Map<String, dynamic> json){

    var rolesJson = json["roles"] as List;
    List<Roles> rolesList = rolesJson.map((x) => Roles.fromJson(x)).toList();

    return Content(
        json["mail"] as String,
        json["firstName"] as String,
        json["lastName"] as String,
        json["enabled"] as bool,
        json["licenseCount"] as int,
        json["licenseMonth"] as int,
        json["trustAppSize"] as int,
        json["trustUrlSize"] as int,
        json["flowAppSize"] as int,
        json["appStoreSize"] as int,
        json["contentStoreSize"] as int,
        json["flowProfilePolicySize"] as int,
        json["allDevicesAllowed"] as bool,
        json["devicesWithoutDataGroupAllowed"] as bool,
        json["adminAreas"] as List,
        rolesList,
        json["ipGroups"] as List,
        json["links"] as List,
        json["code"] as String,
        json["lastModifiedDate"] as String,
        json["createdDate"] as String
    );
  }
}

class Roles {
  String name;
  String desc;
  List<dynamic> permissions;

  Roles(this.name, this.desc, this.permissions);

  factory Roles.fromJson(Map<String, dynamic> json){

    return Roles(
      json["name"] as String,
      json["desc"] as String,
      json["permissions"] as List,
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

