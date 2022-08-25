class Telephony{
  bool networkRoaming;
  String simOperator;
  String networkOperatorName;
  dynamic msisdn;
  String simState;
  dynamic simserialNumber;

  Telephony(this.networkRoaming, this.simOperator, this.networkOperatorName,
      this.msisdn, this.simState, this.simserialNumber);

  factory Telephony.fromJson(Map<String, dynamic> json){
    return Telephony(
        json["networkRoaming"] as bool,
        json["simOperator"] as String,
        json["networkOperatorName"] as String,
        json["msisdn"] as dynamic,
        json["simState"] as String,
        json["simserialNumber"] as dynamic
    );
  }

  @override
  String toString() {
    return 'Telephony{networkRoaming: $networkRoaming, simOperator: $simOperator, networkOperatorName: $networkOperatorName, msisdn: $msisdn, simState: $simState, simserialNumber: $simserialNumber}';
  }
}