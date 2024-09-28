class Parameters {
  String? fixture;

  Parameters({this.fixture});

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        fixture: json['fixture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fixture': fixture,
      };
}
