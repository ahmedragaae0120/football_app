import 'package:football_app/data/models/statisticsmatch_model/statisticsmatchresponse/statistic.dart';
import 'package:football_app/data/models/statisticsmatch_model/statisticsmatchresponse/team.dart';

class Response {
  final Team team;
  final List<Statistic> statistics;

  Response({required this.team, required this.statistics});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      team: Team.fromJson(json['team']),
      statistics: (json['statistics'] as List)
          .map((e) => Statistic.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'team': team.toJson(),
        'statistics': statistics.map((stat) => stat.toJson()).toList(),
      };
}
