import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:football_app/core/api/api_endpoints.dart';
import 'package:football_app/core/api/api_manger.dart';
import 'package:football_app/data/datasource_contract/remote/Standings_datasource_contract.dart';
import 'package:football_app/data/models/standings_model/standings/standings.dart';
import 'package:injectable/injectable.dart';

import '../../models/standings_model/standings/response.dart';

@Injectable(as: StandingsDatasourceContract)
class StandingsDatasourceImpl extends StandingsDatasourceContract {
  @factoryMethod
  StandingsDatasourceImpl(this.apiManger);
  ApiManger apiManger;

  @override
  Future<Either<List<StandingsResponse>?, String>> getStandings(
      {required int leagueId}) async {
    try {
      var response = await apiManger.getRequestFootballApi(
          endPoints: EndPoints.standingsLeague,
          queryParameters: {"season": 2022, "league": leagueId});

      List<StandingsResponse>? standings =
          Standings.fromJson(response.data).response;
      print("League data: $standings");
      return Left(standings);
    } catch (error) {
      log("Error: ${error.toString()}");
      return Right(error.toString());
    }
  }
}
