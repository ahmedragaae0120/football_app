/// long : "First Half"
/// short : "1H"
/// elapsed : 27

class Status {
  Status({
    this.long,
    this.short,
    this.elapsed,
  });

  Status.fromJson(dynamic json) {
    long = json['long'];
    short = json['short'];
    elapsed = json['elapsed'];
  }
  String? long;
  String? short;
  int? elapsed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long'] = long;
    map['short'] = short;
    map['elapsed'] = elapsed;
    return map;
  }
}
