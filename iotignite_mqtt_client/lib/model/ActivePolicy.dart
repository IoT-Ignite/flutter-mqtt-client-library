class ActivePolicy{
  String code;
  String name;

  ActivePolicy(this.code, this.name);

  factory ActivePolicy.fromJson(Map<String, dynamic> json){
    return ActivePolicy(
      json["code"] as String,
      json["name"] as String,
    );
  }

  @override
  String toString() {
    return 'ActivePolicy{code: $code, name: $name}';
  }
}