import 'Fixture.dart';
import 'League.dart';
import 'Teams.dart';
import 'Goals.dart';
import 'Score.dart';
import 'Events.dart';

/// fixture : {"id":1283896,"referee":null,"timezone":"UTC","date":"2024-09-02T13:00:00+00:00","timestamp":1725282000,"periods":{"first":1725282000,"second":null},"venue":{"id":581,"name":"Bramall Lane","city":"Sheffield"},"status":{"long":"First Half","short":"1H","elapsed":27}}
/// league : {"id":703,"name":"Professional Development League","country":"England","logo":"https://media.api-sports.io/football/leagues/703.png","flag":"https://media.api-sports.io/flags/gb.svg","season":2024,"round":"Regular Season - 4"}
/// teams : {"home":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png","winner":true},"away":{"id":20019,"name":"Watford U21","logo":"https://media.api-sports.io/football/teams/20019.png","winner":false}}
/// goals : {"home":3,"away":1}
/// score : {"halftime":{"home":3,"away":1},"fulltime":{"home":null,"away":null},"extratime":{"home":null,"away":null},"penalty":{"home":null,"away":null}}
/// events : [{"time":{"elapsed":12,"extra":null},"team":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png"},"player":{"id":288065,"name":"H. Boyes"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null},{"time":{"elapsed":19,"extra":null},"team":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png"},"player":{"id":18331,"name":"R. Norrington-Davies"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null},{"time":{"elapsed":21,"extra":null},"team":{"id":20019,"name":"Watford U21","logo":"https://media.api-sports.io/football/teams/20019.png"},"player":{"id":18331,"name":"R. Norrington-Davies"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Own Goal","comments":null},{"time":{"elapsed":23,"extra":null},"team":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png"},"player":{"id":null,"name":"R. One"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null}]

class FootballResponse {
  FootballResponse({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.score,
    this.events,
  });

  FootballResponse.fromJson(dynamic json) {
    fixture =
        json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null;
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
    if (json['events'] != null) {
      events = (json['events'] as List)
          .map((eventJson) => Events.fromJson(eventJson))
          .where((event) => event.type == "Goal")
          .toList();
    }

    // if (json['events'] != null) {
    //   events = [];
    //   json['events'].forEach((v) {
    //     events?.add(Events.fromJson(v));
    //   });
    // }
  }
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;
  List<Events>? events;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (fixture != null) {
      map['fixture'] = fixture?.toJson();
    }
    if (league != null) {
      map['league'] = league?.toJson();
    }
    if (teams != null) {
      map['teams'] = teams?.toJson();
    }
    if (goals != null) {
      map['goals'] = goals?.toJson();
    }
    if (score != null) {
      map['score'] = score?.toJson();
    }
    if (events != null) {
      map['events'] = events?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
