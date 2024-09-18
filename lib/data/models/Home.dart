import 'Goals.dart';

/// played : 19
/// win : 17
/// draw : 1
/// lose : 1
/// goals : {"for":60,"against":17}

class Home {
  Home({
      this.played, 
      this.win, 
      this.draw, 
      this.lose, 
      this.goals,});

  Home.fromJson(dynamic json) {
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