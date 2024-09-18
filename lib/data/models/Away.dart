import 'Goals.dart';

/// played : 19
/// win : 11
/// draw : 4
/// lose : 4
/// goals : {"for":34,"against":16}

class Away {
  Away({
      this.played, 
      this.win, 
      this.draw, 
      this.lose, 
      this.goals,});

  Away.fromJson(dynamic json) {
    played = json['played'];
    win = json['win'];
    draw = json['draw'];
    lose = json['lose'];
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
  }
  num? played;
  num? win;
  num? draw;
  num? lose;
  Goals? goals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['played'] = played;
    map['win'] = win;
    map['draw'] = draw;
    map['lose'] = lose;
    if (goals != null) {
      map['goals'] = goals?.toJson();
    }
    return map;
  }

}