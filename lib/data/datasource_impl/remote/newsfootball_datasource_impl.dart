import 'package:dartz/dartz.dart';
import 'package:football_app/core/api/api_endpoints.dart';
import 'package:football_app/core/api/api_manger.dart';
import 'package:football_app/core/constants.dart';
import 'package:football_app/data/datasource_contract/remote/newsfootball_datasource_contract.dart';
import 'package:football_app/data/models/news_model/Articles.dart';
import 'package:football_app/data/models/news_model/NewsResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewsfootballDatasourceContract)
class NewsfootballDatasourceImpl extends NewsfootballDatasourceContract {
  @factoryMethod
  NewsfootballDatasourceImpl(this.apiManger);
  ApiManger apiManger;
  @override
  Future<Either<List<Articles>, String>> getNewsFootball(
      {int? pageSize,int? page}) async {
    try {
      var response = await apiManger
          .getRequestNewsApi(endPoints: EndPoints.allNews, queryParameters: {
        "apiKey": Constants.newsApiKey,
        "q": "football",
        "language": "en",
        "pageSize": pageSize,
        "page":page,
      });
      List<Articles> listArticles =
          NewsResponse.fromJson(response.data).articles ?? [];
      return Left(listArticles);
    } catch (error) {
      return right(error.toString());
    }
  }
}
