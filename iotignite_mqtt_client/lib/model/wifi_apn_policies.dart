class WifiApnPolicies {

  List<dynamic> blackList;
  List<dynamic> whiteList;
  List<dynamic> trustedStores;
  List<dynamic> ruleOrders;

  WifiApnPolicies(
      this.blackList, this.whiteList, this.trustedStores, this.ruleOrders);

  factory WifiApnPolicies.fromJson(Map<String, dynamic> json){
    return WifiApnPolicies(
        json["blackList"] as List,
        json["whiteList"] as List,
        json["trustedStores"] as List,
        json["ruleOrders"] as List
    );
  }

  @override
  String toString() {
    return 'WifiApnPolicies{blackList: $blackList, whiteList: $whiteList, trustedStores: $trustedStores, ruleOrders: $ruleOrders}';
  }
}