import 'league.dart';

class StandingsResponse {
  League? league;

  StandingsResponse({this.league});

  factory StandingsResponse.fromJson(Map<String, dynamic> json) =>
      StandingsResponse(
        league: json['league'] == null
            ? null
            : League.fromJson(json['league'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'league': league?.toJson(),
      };
}
