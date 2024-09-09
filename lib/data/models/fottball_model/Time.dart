/// elapsed : 12
/// extra : null

class Time {
  Time({
    this.elapsed,
    this.extra,
  });

  Time.fromJson(dynamic json) {
    elapsed = json['elapsed'];
    extra = json['extra'];
  }
  int? elapsed;
  dynamic extra;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['elapsed'] = elapsed;
    map['extra'] = extra;
    return map;
  }
}
