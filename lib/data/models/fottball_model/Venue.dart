/// id : 581
/// name : "Bramall Lane"
/// city : "Sheffield"

class Venue {
  Venue({
    this.id,
    this.name,
    this.city,
  });

  Venue.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }
  int? id;
  String? name;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['city'] = city;
    return map;
  }
}
