/// live : "all"

class Parameters {
  Parameters({
    this.live,
  });

  Parameters.fromJson(dynamic json) {
    live = json['live'];
  }
  String? live;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['live'] = live;
    return map;
  }
}
