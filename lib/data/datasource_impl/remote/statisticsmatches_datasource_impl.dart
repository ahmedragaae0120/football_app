import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:football_app/core/api/api_endpoints.dart';
import 'package:football_app/core/api/api_manger.dart';
import 'package:football_app/data/datasource_contract/remote/statisticsmatches_datasource_contract.dart';
import 'package:football_app/data/models/statisticsmatch_model/statisticsmatchresponse/response.dart';
import 'package:football_app/data/models/statisticsmatch_model/statisticsmatchresponse/statisticsmatchresponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: StatisticsMatchesDatasourceContract)
class StatisticsmatchesDatasourceImpl
    extends StatisticsMatchesDatasourceContract {
  @factoryMethod
  StatisticsmatchesDatasourceImpl(this.apiManger);

  ApiManger apiManger;
  @override
  Future<Either<List<Response>, String>> getStatisticsMatch(
      {required int fixtureId}) async {
    try {
      var response = await apiManger.getRequestFootballApi(
          endPoints: EndPoints.statisticsMatch,
          queryParameters: {"fixture": fixtureId});
      print('response data : ${response.data}');
      List<Response>? statisticsMatch =
          StatisticsMatchResponse.fromJson(response.data).response;
      print('statisticsMatch from json : $statisticsMatch');
      if (statisticsMatch!.isEmpty) {
        return const Right("No Statistics");
      }
      return Left(statisticsMatch);
    } catch (error) {
      log(error.toString());
      return Right(error.toString());
    }
  }
}
