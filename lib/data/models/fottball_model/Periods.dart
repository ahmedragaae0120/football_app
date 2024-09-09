/// first : 1725282000
/// second : null

class Periods {
  Periods({
    this.first,
    this.second,
  });

  Periods.fromJson(dynamic json) {
    first = json['first'];
    second = json['second'];
  }
  int? first;
  dynamic second;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['second'] = second;
    return map;
  }
}
