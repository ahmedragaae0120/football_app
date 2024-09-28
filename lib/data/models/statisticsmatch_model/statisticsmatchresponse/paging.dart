class Paging {
  int? current;
  int? total;

  Paging({this.current, this.total});

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json['current'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current': current,
        'total': total,
      };
}
