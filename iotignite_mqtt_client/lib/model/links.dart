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

  @override
  String toString() {
    return 'Links{rel: $rel, href: $href}';
  }
}