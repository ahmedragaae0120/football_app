/// id : 703
/// name : "Professional Development League"
/// country : "England"
/// logo : "https://media.api-sports.io/football/leagues/703.png"
/// flag : "https://media.api-sports.io/flags/gb.svg"
/// season : 2024
/// round : "Regular Season - 4"

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.round,
  });

  League.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    round = json['round'];
  }
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  String? round;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['country'] = country;
    map['logo'] = logo;
    map['flag'] = flag;
    map['season'] = season;
    map['round'] = round;
    return map;
  }
}
