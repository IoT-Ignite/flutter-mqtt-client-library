class AdminArea {
  String code;
  String tenantDomain;
  String name;

  AdminArea(this.code, this.name, this.tenantDomain);

  factory AdminArea.fromJson(Map<String, dynamic> json) {
    return AdminArea(
      json["code"] as String,
      json["name"] as String,
      json["tenantDomain"] == null ? "" : json["tenantDomain"] as String,
    );
  }

  @override
  String toString() {
    return 'AdminArea{code: $code, tenantDomain: $tenantDomain, name: $name}';
  }
}