/// id : null
/// name : null

class Assist {
  Assist({
    this.id,
    this.name,
  });

  Assist.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  dynamic id;
  dynamic name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
