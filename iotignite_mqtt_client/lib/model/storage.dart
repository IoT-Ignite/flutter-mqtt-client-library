class Storage{
  String availIntMemSize;
  String totalExtMemSize;
  String totalIntMemSize;
  bool isExtMemAvail;
  String availExtMemSize;

  Storage(this.availIntMemSize, this.totalExtMemSize, this.totalIntMemSize,
      this.isExtMemAvail, this.availExtMemSize);

  factory Storage.fromJson(Map<String, dynamic> json){
    return Storage(
      json["availIntMemSize"] as String,
      json["totalExtMemSize"] as String,
      json["totalIntMemSize"] as String,
      json["isExtMemAvail"] as bool,
      json["availExtMemSize"] as String,
    );
  }

  @override
  String toString() {
    return 'Storage{availIntMemSize: $availIntMemSize, totalExtMemSize: $totalExtMemSize, totalIntMemSize: $totalIntMemSize, isExtMemAvail: $isExtMemAvail, availExtMemSize: $availExtMemSize}';
  }
}