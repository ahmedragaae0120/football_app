/// id : 20086
/// name : "Sheffield United U21"
/// logo : "https://media.api-sports.io/football/teams/20086.png"

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
  });

  Team.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }
  int? id;
  String? name;
  String? logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logo'] = logo;
    return map;
  }
}
