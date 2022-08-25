class OsProfile{
  dynamic hardware;
  dynamic host;
  dynamic display;
  dynamic product;
  dynamic board;
  String model;
  dynamic device;
  dynamic serial;

  OsProfile(this.hardware, this.host, this.display, this.product, this.board,
      this.model, this.device, this.serial);

  factory OsProfile.fromJson(Map<String, dynamic> json){
    return OsProfile(
        json["hardware"] as dynamic,
        json["host"] as dynamic,
        json["display"] as dynamic,
        json["product"] as dynamic,
        json["board"] as dynamic,
        json["model"] as String,
        json["device"] as dynamic,
        json["serial"] as dynamic
    );
  }

  @override
  String toString() {
    return 'OsProfile{hardware: $hardware, host: $host, display: $display, product: $product, board: $board, model: $model, device: $device, serial: $serial}';
  }
}