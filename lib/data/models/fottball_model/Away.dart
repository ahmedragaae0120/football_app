/// id : 20019
/// name : "Watford U21"
/// logo : "https://media.api-sports.io/football/teams/20019.png"
/// winner : false

class Away {
  Away({
    this.id,
    this.name,
    this.logo,
    this.winner,
  });

  Away.fromJson(dynamic json) {
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
