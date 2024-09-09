/// id : 20086
/// name : "Sheffield United U21"
/// logo : "https://media.api-sports.io/football/teams/20086.png"
/// winner : true

class Home {
  Home({
    this.id,
    this.name,
    this.logo,
    this.winner,
  });

  Home.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logo'] = logo;
    map['winner'] = winner;
    return map;
  }
}
