import 'Time.dart';
import 'Team.dart';
import 'Player.dart';
import 'Assist.dart';

/// time : {"elapsed":12,"extra":null}
/// team : {"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png"}
/// player : {"id":288065,"name":"H. Boyes"}
/// assist : {"id":null,"name":null}
/// type : "Goal"
/// detail : "Normal Goal"
/// comments : null

class Events {
  Events({
    this.time,
    this.team,
    this.player,
    this.assist,
    this.type,
    this.detail,
    this.comments,
  });

  Events.fromJson(dynamic json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    assist = json['assist'] != null ? Assist.fromJson(json['assist']) : null;
    type = json['type'];
    detail = json['detail'];
    comments = json['comments'];
  }
  Time? time;
  Team? team;
  Player? player;
  Assist? assist;
  String? type;
  String? detail;
  dynamic comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (time != null) {
      map['time'] = time?.toJson();
    }
    if (team != null) {
      map['team'] = team?.toJson();
    }
    if (player != null) {
      map['player'] = player?.toJson();
    }
    if (assist != null) {
      map['assist'] = assist?.toJson();
    }
    map['type'] = type;
    map['detail'] = detail;
    map['comments'] = comments;
    return map;
  }
}
