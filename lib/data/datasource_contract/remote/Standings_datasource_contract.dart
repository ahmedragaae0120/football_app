import 'package:dartz/dartz.dart';
import 'package:football_app/data/models/standings_model/standings/response.dart';


abstract class StandingsDatasourceContract {
  Future<Either<List<StandingsResponse>?, String>> getStandings({required int leagueId});
}
