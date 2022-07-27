class Datas{

  String login;
  int id;
  String node_id;
  String avatar_url;
  String gravatar_id;
  String url;
  String html_url;
  String followers_url;
  String following_url;
  String gists_url;
  String starred_url;
  String subscriptions_url;
  String organizations_url;
  String repos_url;
  String events_url;
  String received_events_url;
  String type;
  bool site_admin;
  String name;
  dynamic company;
  String blog;
  dynamic location;
  dynamic email;
  dynamic hireable;
  dynamic bio;
  dynamic twitter_username;
  int public_repos;
  int public_gists;
  int followers;
  int following;
  String created_at;
  String updated_at;

  Datas(
      this.login,
      this.id,
      this.node_id,
      this.avatar_url,
      this.gravatar_id,
      this.url,
      this.html_url,
      this.followers_url,
      this.following_url,
      this.gists_url,
      this.starred_url,
      this.subscriptions_url,
      this.organizations_url,
      this.repos_url,
      this.events_url,
      this.received_events_url,
      this.type,
      this.site_admin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.twitter_username,
      this.public_repos,
      this.public_gists,
      this.followers,
      this.following,
      this.created_at,
      this.updated_at );

  factory Datas.fromJson(Map<String, dynamic> json){
    return Datas(
        json["login"] as String,
        json["id"] as int,
        json["node_id"] as String,
        json["avatar_url"] as String,
        json["gravatar_id"] as String,
        json["url"] as String,
        json["html_url"] as String,
        json["followers_url"] as String,
        json["following_url"] as String,
        json["gists_url"] as String,
        json["starred_url"] as String,
        json["subscriptions_url"] as String,
        json["organizations_url"] as String,
        json["repos_url"] as String,
        json["events_url"] as String,
        json["received_events_url"] as String,
        json["type"] as String,
        json["site_admin"] as bool,
        json["name"] as String,
        json["company"] as dynamic,
        json["blog"] as String,
        json["location"] as dynamic,
        json["email"] as dynamic,
        json["hireable"] as dynamic,
        json["bio"] as dynamic,
        json["twitter_username"] as dynamic,
        json["public_repos"] as int,
        json["public_gists"] as int,
        json["followers"] as int,
        json["following"] as int,
        json["created_at"] as String,
        json["updated_at"] as String,
    );

  }

  @override
  String toString() {
    return 'Datas{login: $login, id: $id, node_id: $node_id, avatar_url: $avatar_url, gravatar_id: $gravatar_id, url: $url, html_url: $html_url, followers_url: $followers_url, following_url: $following_url, gists_url: $gists_url, starred_url: $starred_url, subscriptions_url: $subscriptions_url, organizations_url: $organizations_url, repos_url: $repos_url, events_url: $events_url, received_events_url: $received_events_url, type: $type, site_admin: $site_admin, name: $name, company: $company, blog: $blog, location: $location, email: $email, hireable: $hireable, bio: $bio, twitter_username: $twitter_username, public_repos: $public_repos, public_gists: $public_gists, followers: $followers, following: $following, created_at: $created_at, updated_at: $updated_at}';
  }


}