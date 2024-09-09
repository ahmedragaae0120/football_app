import 'Parameters.dart';
import 'Paging.dart';
import 'Response.dart';

/// get : "fixtures"
/// parameters : {"live":"all"}
/// errors : []
/// results : 3
/// paging : {"current":1,"total":1}
/// response : [{"fixture":{"id":1283896,"referee":null,"timezone":"UTC","date":"2024-09-02T13:00:00+00:00","timestamp":1725282000,"periods":{"first":1725282000,"second":null},"venue":{"id":581,"name":"Bramall Lane","city":"Sheffield"},"status":{"long":"First Half","short":"1H","elapsed":27}},"league":{"id":703,"name":"Professional Development League","country":"England","logo":"https://media.api-sports.io/football/leagues/703.png","flag":"https://media.api-sports.io/flags/gb.svg","season":2024,"round":"Regular Season - 4"},"teams":{"home":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png","winner":true},"away":{"id":20019,"name":"Watford U21","logo":"https://media.api-sports.io/football/teams/20019.png","winner":false}},"goals":{"home":3,"away":1},"score":{"halftime":{"home":3,"away":1},"fulltime":{"home":null,"away":null},"extratime":{"home":null,"away":null},"penalty":{"home":null,"away":null}},"events":[{"time":{"elapsed":12,"extra":null},"team":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png"},"player":{"id":288065,"name":"H. Boyes"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null},{"time":{"elapsed":19,"extra":null},"team":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png"},"player":{"id":18331,"name":"R. Norrington-Davies"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null},{"time":{"elapsed":21,"extra":null},"team":{"id":20019,"name":"Watford U21","logo":"https://media.api-sports.io/football/teams/20019.png"},"player":{"id":18331,"name":"R. Norrington-Davies"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Own Goal","comments":null},{"time":{"elapsed":23,"extra":null},"team":{"id":20086,"name":"Sheffield United U21","logo":"https://media.api-sports.io/football/teams/20086.png"},"player":{"id":null,"name":"R. One"},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null}]},{"fixture":{"id":1294542,"referee":null,"timezone":"UTC","date":"2024-09-02T13:00:00+00:00","timestamp":1725282000,"periods":{"first":1725282000,"second":null},"venue":{"id":null,"name":"Estádio Municipal de Ibirité","city":"Ibirité, Minas Gerais"},"status":{"long":"First Half","short":"1H","elapsed":30}},"league":{"id":1107,"name":"Mineiro U20","country":"Brazil","logo":"https://media.api-sports.io/football/leagues/1107.png","flag":"https://media.api-sports.io/flags/br.svg","season":2024,"round":"Quarter-finals"},"teams":{"home":{"id":23646,"name":"Contagem U20","logo":"https://media.api-sports.io/football/teams/23646.png","winner":null},"away":{"id":20758,"name":"Inter de Minas U20","logo":"https://media.api-sports.io/football/teams/20758.png","winner":null}},"goals":{"home":0,"away":0},"score":{"halftime":{"home":0,"away":0},"fulltime":{"home":null,"away":null},"extratime":{"home":null,"away":null},"penalty":{"home":null,"away":null}},"events":[]},{"fixture":{"id":1283890,"referee":null,"timezone":"UTC","date":"2024-09-02T12:00:00+00:00","timestamp":1725278400,"periods":{"first":1725278400,"second":1725282000},"venue":{"id":11876,"name":"Mornflake Stadium","city":"Crewe, Cheshire"},"status":{"long":"Second Half","short":"2H","elapsed":70}},"league":{"id":703,"name":"Professional Development League","country":"England","logo":"https://media.api-sports.io/football/leagues/703.png","flag":"https://media.api-sports.io/flags/gb.svg","season":2024,"round":"Regular Season - 4"},"teams":{"home":{"id":20093,"name":"Crewe Alexandra U21","logo":"https://media.api-sports.io/football/teams/20093.png","winner":false},"away":{"id":20094,"name":"Ipswich Town U21","logo":"https://media.api-sports.io/football/teams/20094.png","winner":true}},"goals":{"home":0,"away":2},"score":{"halftime":{"home":0,"away":1},"fulltime":{"home":null,"away":null},"extratime":{"home":null,"away":null},"penalty":{"home":null,"away":null}},"events":[{"time":{"elapsed":31,"extra":null},"team":{"id":20094,"name":"Ipswich Town U21","logo":"https://media.api-sports.io/football/teams/20094.png"},"player":{"id":null,"name":null},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null},{"time":{"elapsed":62,"extra":null},"team":{"id":20094,"name":"Ipswich Town U21","logo":"https://media.api-sports.io/football/teams/20094.png"},"player":{"id":null,"name":null},"assist":{"id":null,"name":null},"type":"Goal","detail":"Normal Goal","comments":null}]}]

class LiveMatchesResponse {
  LiveMatchesResponse({
    this.get,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  LiveMatchesResponse.fromJson(dynamic json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    // if (json['errors'] != null) {
    //   errors = [];
    //   json['errors'].forEach((v) {
    //     errors?.add(errors.fromJson(v));
    //   });
    // }
    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(Response.fromJson(v));
      });
    }
  }
  String? get;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Response>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['get'] = get;
    if (parameters != null) {
      map['parameters'] = parameters?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['results'] = results;
    if (paging != null) {
      map['paging'] = paging?.toJson();
    }
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
