import 'paging.dart';
import 'parameters.dart';
import 'response.dart';

class Standings {
  String? standingsGet;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<StandingsResponse>? response;

  Standings({
    this.standingsGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory Standings.fromJson(Map<String, dynamic> json) => Standings(
        standingsGet: json['get'] as String?,
        parameters: json['parameters'] == null
            ? null
            : Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
        errors: json['errors'] as List<dynamic>?,
        results: json['results'] as int?,
        paging: json['paging'] == null
            ? null
            : Paging.fromJson(json['paging'] as Map<String, dynamic>),
        response: (json['response'] as List<dynamic>?)
            ?.map((e) => StandingsResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'get': standingsGet,
        'parameters': parameters?.toJson(),
        'errors': errors,
        'results': results,
        'paging': paging?.toJson(),
        'response': response?.map((e) => e.toJson()).toList(),
      };
}
