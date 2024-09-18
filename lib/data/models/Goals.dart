/// for : 34
/// against : 16

class Goals {
  Goals({
      this.for, 
      this.against,});

  Goals.fromJson(dynamic json) {
    for = json['for'];
    against = json['against'];
  }
  num? for;
  num? against;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['for'] = for;
    map['against'] = against;
    return map;
  }

}