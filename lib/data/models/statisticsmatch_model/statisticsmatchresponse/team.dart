class Team {
  final int id;
  final String name;
  final String logo;

  Team({required this.id, required this.name, required this.logo});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
      };
}