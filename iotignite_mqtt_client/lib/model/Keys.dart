class Keys {
  String apiKey;
  String secretKey;

  Keys(this.apiKey, this.secretKey);

  factory Keys.fromJson(Map<String, dynamic> json) {
    return Keys(
      json["apiKey"] as String,
      json["secretKey"] as String,
    );
  }

  @override
  String toString() {
    return 'Keys{apiKey: $apiKey, secretKey: $secretKey}';
  }
}