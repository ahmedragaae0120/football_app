class Goals {
  int? goalsFor;
  int? against;

  Goals({this.goalsFor, this.against});

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        goalsFor: json['for'] as int?,
        against: json['against'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'for': goalsFor,
        'against': against,
      };
}
