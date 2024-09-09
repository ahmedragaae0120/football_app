/// home : null
/// away : null

class Extratime {
  Extratime({
    this.home,
    this.away,
  });

  Extratime.fromJson(dynamic json) {
    home = json['home'];
    away = json['away'];
  }
  dynamic home;
  dynamic away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = home;
    map['away'] = away;
    return map;
  }
}
