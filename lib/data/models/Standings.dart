import 'Team.dart';
import 'All.dart';
import 'Home.dart';
import 'Away.dart';

/// rank : 1
/// team : {"id":50,"name":"Manchester City","logo":"https://media.api-sports.io/football/teams/50.png"}
/// points : 89
/// goalsDiff : 61
/// group : "Premier League"
/// form : "LDWWW"
/// status : "same"
/// description : "Promotion - Champions League (Group Stage: )"
/// all : {"played":38,"win":28,"draw":5,"lose":5,"goals":{"for":94,"against":33}}
/// home : {"played":19,"win":17,"draw":1,"lose":1,"goals":{"for":60,"against":17}}
/// away : {"played":19,"win":11,"draw":4,"lose":4,"goals":{"for":34,"against":16}}
/// update : "2023-05-28T00:00:00+00:00"

class Standings {
  Standings({
      this.rank, 
      this.team, 
      this.points, 
      this.goalsDiff, 
      this.group, 
      this.form, 
      this.status, 
      this.description, 
      this.all, 
      this.home, 
      this.away, 
      this.update,});

  Standings.fromJson(dynamic json) {
    rank = json['rank'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    points = json['points'];
    goalsDiff = json['goalsDiff'];
    group = json['group'];
    form = json['form'];
    status = json['status'];
    description = json['description'];
    all = json['all'] != null ? All.fromJson(json['all']) : null;
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    away = json['away'] != null ? Away.fromJson(json['away']) : null;
    update = json['update'];
  }
  num? rank;
  Team? team;
  num? points;
  num? goalsDiff;
  String? group;
  String? form;
  String? status;
  String? description;
  All? all;
  Home? home;
  Away? away;
  String? update;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rank'] = rank;
    if (team != null) {
      map['team'] = team?.toJson();
    }
    map['points'] = points;
    map['goalsDiff'] = goalsDiff;
    map['group'] = group;
    map['form'] = form;
    map['status'] = status;
    map['description'] = description;
    if (all != null) {
      map['all'] = all?.toJson();
    }
    if (home != null) {
      map['home'] = home?.toJson();
    }
    if (away != null) {
      map['away'] = away?.toJson();
    }
    map['update'] = update;
    return map;
  }

}