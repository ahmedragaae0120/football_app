class Statistic {
  final String type;
  final dynamic value; // يمكن أن تكون int أو String أو null

  Statistic({required this.type, required this.value});

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}
