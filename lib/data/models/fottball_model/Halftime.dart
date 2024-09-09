/// home : 3
/// away : 1

class Halftime {
  Halftime({
    this.home,
    this.away,
  });

  Halftime.fromJson(dynamic json) {
    home = json['home'];
    away = json['away'];
  }
  int? home;
  int? away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = home;
    map['away'] = away;
    return map;
  }
}
