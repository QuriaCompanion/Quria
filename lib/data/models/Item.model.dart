class Item {
  String? instanceId;
  int? itemHash;
  bool? isEquipped;
  List<int>? mods;
  int? bucketHash;

  Item({this.instanceId, this.itemHash, this.isEquipped, this.mods, this.bucketHash});

  Item.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    itemHash = json['itemHash'];
    isEquipped = json['isEquipped'];
    mods = json['mods'].cast<int>();
    bucketHash = json['bucketHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['instanceId'] = instanceId;
    data['itemHash'] = itemHash;
    data['isEquipped'] = isEquipped;
    data['mods'] = mods;
    data['bucketHash'] = bucketHash;
    return data;
  }
}
