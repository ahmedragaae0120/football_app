/// home : null
/// away : null

class Penalty {
  Penalty({
    this.home,
    this.away,
  });

  Penalty.fromJson(dynamic json) {
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
