class Settings {

  String name;
  String value;

  Settings(this.name, this.value);

  factory Settings.fromJson(Map<String, dynamic> json){
    return Settings(
        json["name"] as String,
        json["value"] as String
    );
  }

  @override
  String toString() {
    return 'Settings{name: $name, value: $value}';
  }
}