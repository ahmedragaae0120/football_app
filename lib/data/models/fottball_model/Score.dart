import 'Halftime.dart';
import 'Fulltime.dart';
import 'Extratime.dart';
import 'Penalty.dart';

/// halftime : {"home":3,"away":1}
/// fulltime : {"home":null,"away":null}
/// extratime : {"home":null,"away":null}
/// penalty : {"home":null,"away":null}

class Score {
  Score({
    this.halftime,
    this.fulltime,
    this.extratime,
    this.penalty,
  });

  Score.fromJson(dynamic json) {
    halftime =
        json['halftime'] != null ? Halftime.fromJson(json['halftime']) : null;
    fulltime =
        json['fulltime'] != null ? Fulltime.fromJson(json['fulltime']) : null;
    extratime = json['extratime'] != null
        ? Extratime.fromJson(json['extratime'])
        : null;
    penalty =
        json['penalty'] != null ? Penalty.fromJson(json['penalty']) : null;
  }
  Halftime? halftime;
  Fulltime? fulltime;
  Extratime? extratime;
  Penalty? penalty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (halftime != null) {
      map['halftime'] = halftime?.toJson();
    }
    if (fulltime != null) {
      map['fulltime'] = fulltime?.toJson();
    }
    if (extratime != null) {
      map['extratime'] = extratime?.toJson();
    }
    if (penalty != null) {
      map['penalty'] = penalty?.toJson();
    }
    return map;
  }
}
