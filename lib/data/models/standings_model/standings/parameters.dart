class Parameters {
  String? season;
  String? league;

  Parameters({this.season, this.league});

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        season: json['season'] as String?,
        league: json['league'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'season': season,
        'league': league,
      };
}
