import 'package:dartz/dartz.dart';
import 'package:football_app/data/models/news_model/Articles.dart';

abstract class SearchNewsDatasourceContract {
    Future<Either<List<Articles>, String>> getNews(
      {int pageSize, int page, String textSearch});
}