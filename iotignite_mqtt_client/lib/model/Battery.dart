class Battery{
  String scale;
  String level;
  String source;
  String voltage;

  Battery(this.scale, this.level, this.source, this.voltage);

  factory Battery.fromJson(Map<String, dynamic> json){
    return Battery(
      json["scale"] as String,
      json["level"] as String,
      json["source"] as String,
      json["voltage"] as String,
    );
  }

  @override
  String toString() {
    return 'Battery{scale: $scale, level: $level, source: $source, voltage: $voltage}';
  }
}