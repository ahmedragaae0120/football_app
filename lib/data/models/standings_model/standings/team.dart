class Team {
  int? id;
  String? name;
  String? logo;

  Team({this.id, this.name, this.logo});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'] as int?,
        name: json['name'] as String?,
        logo: json['logo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
      };
}
