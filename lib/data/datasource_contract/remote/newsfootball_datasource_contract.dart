import 'package:dartz/dartz.dart';
import 'package:football_app/data/models/news_model/Articles.dart';

abstract class NewsfootballDatasourceContract {
  Future<Either<List<Articles>, String>> getNewsFootball(
      {int pageSize, int page});
}
