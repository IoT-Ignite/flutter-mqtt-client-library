class Policy{
  String code;
  String name;

  Policy(this.code, this.name);

  factory Policy.fromJson(Map<String, dynamic> json){
    return Policy(
        json["code"] as String,
        json["name"] == null ? "" : json["name"] as String
    );
  }

  @override
  String toString() {
    return 'Policy{code: $code, name: $name}';
  }
}