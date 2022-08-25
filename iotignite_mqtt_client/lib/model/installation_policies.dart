class InstallationPolicies {

  List<dynamic> blackList;
  List<dynamic> whiteList;
  List<dynamic> trustedStores;
  List<dynamic> ruleOrders;

  InstallationPolicies(
      this.blackList, this.whiteList, this.trustedStores, this.ruleOrders);

  factory InstallationPolicies.fromJson(Map<String, dynamic> json){
    return InstallationPolicies(
        json["blackList"] as List,
        json["whiteList"] as List,
        json["trustedStores"] as List,
        json["ruleOrders"] as List
    );
  }

  @override
  String toString() {
    return 'InstallationPolicies{blackList: $blackList, whiteList: $whiteList, trustedStores: $trustedStores, ruleOrders: $ruleOrders}';
  }
}