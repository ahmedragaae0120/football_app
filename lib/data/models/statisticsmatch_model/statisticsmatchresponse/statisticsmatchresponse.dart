import 'paging.dart';
import 'response.dart';

class StatisticsMatchResponse {
  final String get;
  final Map<String, dynamic> parameters;
  final List<dynamic> errors;
  int? results;
  Paging? paging;
  List<Response>? response;

  StatisticsMatchResponse({
    required this.get,
    required this.parameters,
    this.results,
    required this.errors,
    this.paging,
    this.response,
  });

  factory StatisticsMatchResponse.fromJson(Map<String, dynamic> json) {
    return StatisticsMatchResponse(
      get: json['get'],
      parameters: json['parameters'],
      errors: json['errors'],
      results: json['results'],
      paging: Paging.fromJson(json['paging']),
      response:
          (json['response'] as List).map((e) => Response.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'get': get,
        'parameters': parameters,
        'errors': errors,
        'results': results,
        'paging': paging?.toJson(),
        'response': response?.map((e) => e.toJson()).toList(),
      };
}
