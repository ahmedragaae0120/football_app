import 'goals.dart';

class All {
  int? played;
  int? win;
  int? draw;
  int? lose;
  Goals? goals;

  All({this.played, this.win, this.draw, this.lose, this.goals});

  factory All.fromJson(Map<String, dynamic> json) => All(
        played: json['played'] as int?,
        win: json['win'] as int?,
        draw: json['draw'] as int?,
        lose: json['lose'] as int?,
        goals: json['goals'] == null
            ? null
            : Goals.fromJson(json['goals'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'played': played,
        'win': win,
        'draw': draw,
        'lose': lose,
        'goals': goals?.toJson(),
      };
}
