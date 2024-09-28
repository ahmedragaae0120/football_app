import 'package:dartz/dartz.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';

abstract class LiveMatchesDatasourceContract {
  Future<Either<List<FootballResponse>, String>> getAllLivematches();
}
