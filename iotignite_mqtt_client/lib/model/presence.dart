class Presence{
  String state;
  String clientIp;

  Presence(this.state, this.clientIp);

  factory Presence.fromJson(Map<String, dynamic> json){
    return Presence(
      json["state"] as String,
      json["clientIp"] as String,
    );
  }

  @override
  String toString() {
    return 'Presence{state: $state, clientIp: $clientIp}';
  }
}