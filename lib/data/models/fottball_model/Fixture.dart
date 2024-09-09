import 'Periods.dart';
import 'Venue.dart';
import 'Status.dart';

/// id : 1283896
/// referee : null
/// timezone : "UTC"
/// date : "2024-09-02T13:00:00+00:00"
/// timestamp : 1725282000
/// periods : {"first":1725282000,"second":null}
/// venue : {"id":581,"name":"Bramall Lane","city":"Sheffield"}
/// status : {"long":"First Half","short":"1H","elapsed":27}

class Fixture {
  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  Fixture.fromJson(dynamic json) {
    id = json['id'];
    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    periods =
        json['periods'] != null ? Periods.fromJson(json['periods']) : null;
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  int? id;
  dynamic referee;
  String? timezone;
  String? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['referee'] = referee;
    map['timezone'] = timezone;
    map['date'] = date;
    map['timestamp'] = timestamp;
    if (periods != null) {
      map['periods'] = periods?.toJson();
    }
    if (venue != null) {
      map['venue'] = venue?.toJson();
    }
    if (status != null) {
      map['status'] = status?.toJson();
    }
    return map;
  }
}
