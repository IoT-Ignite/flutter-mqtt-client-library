class Bluetooth{
  String bluetoothState;
  dynamic bluetoothMacId;
  bool bluetoothSupported;
  dynamic bluetoothpaireddevices;

  Bluetooth(this.bluetoothState, this.bluetoothMacId, this.bluetoothSupported,
      this.bluetoothpaireddevices);

  factory Bluetooth.fromJson(Map<String, dynamic> json){
    return Bluetooth(
      json["bluetoothState"] == null ? null : json["bluetoothState"] as String,
      json["bluetoothMacId"] as dynamic,
      json["bluetoothSupported"] == null ? null : json["bluetoothSupported"] as bool,
      json["bluetoothpaireddevices"] as dynamic,
    );
  }

  @override
  String toString() {
    return 'Bluetooth{bluetoothState: $bluetoothState, bluetoothMacId: $bluetoothMacId, bluetoothSupported: $bluetoothSupported, bluetoothpaireddevices: $bluetoothpaireddevices}';
  }
}