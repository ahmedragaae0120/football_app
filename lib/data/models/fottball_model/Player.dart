/// id : 288065
/// name : "H. Boyes"

class Player {
  Player({
    this.id,
    this.name,
  });

  Player.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
