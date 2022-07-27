class Datas{

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;
  String name;
  dynamic company;
  String blog;
  dynamic location;
  dynamic email;
  dynamic hireable;
  dynamic bio;
  dynamic twitterUsername;
  int publicRepos;
  int publicGists;
  int followers;
  int following;
  DateTime createdAt;
  DateTime updatedAt;

  Datas(
      this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.twitterUsername,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt );

  factory Datas.fromJson(Map<String, dynamic> json){
    return Datas(
        json["login"] as String,
        json["id"] as int,
        json["nodeId"] as String,
        json["avatarUrl"] as String,
        json["gravatarId"] as String,
        json["url"] as String,
        json["htmlUrl"] as String,
        json["followersUrl"] as String,
        json["followingUrl"] as String,
        json["gistsUrl"] as String,
        json["starredUrl"] as String,
        json["subscriptionsUrl"] as String,
        json["organizationsUrl"] as String,
        json["reposUrl"] as String,
        json["eventsUrl"] as String,
        json["receivedEventsUrl"] as String,
        json["type"] as String,
        json["siteAdmin"] as bool,
        json["name"] as String,
        json["company"] as dynamic,
        json["blog"] as String,
        json["location"] as dynamic,
        json["email"] as dynamic,
        json["hireable"] as dynamic,
        json["bio"] as dynamic,
        json["twitterUsername"] as dynamic,
        json["publicRepos"] as int,
        json["publicGists"] as int,
        json["followers"] as int,
        json["following"] as int,
        json["createdAt"] as DateTime,
        json["updatedAt"] as DateTime,
    );

  }
}