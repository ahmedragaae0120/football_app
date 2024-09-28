import 'package:dartz/dartz.dart';
import 'package:football_app/data/models/statisticsmatch_model/statisticsmatchresponse/response.dart';

abstract class StatisticsMatchesDatasourceContract {
  Future<Either< List<Response>, String>> getStatisticsMatch(
      {required int fixtureId});
}
