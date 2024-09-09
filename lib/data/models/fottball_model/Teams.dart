import 'Home.dart';
import 'Away.dart';

/// home : {"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png","winner":true}
/// away : {"id":20019,"name":"Watford U21","logo":"https://media.api-sports.io/football/teams/20019.png","winner":false}

class Teams {
  Teams({
    this.home,
    this.away,
  });

  Teams.fromJson(dynamic json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    away = json['away'] != null ? Away.fromJson(json['away']) : null;
  }
  Home? home;
  Away? away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (home != null) {
      map['home'] = home?.toJson();
    }
    if (away != null) {
      map['away'] = away?.toJson();
    }
    return map;
  }
}
