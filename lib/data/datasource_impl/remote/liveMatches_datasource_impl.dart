import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:football_app/core/api/api_endpoints.dart';
import 'package:football_app/core/api/api_manger.dart';
import 'package:football_app/data/datasource_contract/remote/liveMatches_datasource_contract.dart';
import 'package:football_app/data/models/fottball_model/LiveMatchesResponse.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LiveMatchesDatasourceContract)
class LivematchesDatasourceImpl extends LiveMatchesDatasourceContract {
  @factoryMethod
  LivematchesDatasourceImpl(this.apiManger);
  ApiManger apiManger;
  @override
  Future<Either<List<Response>, String>> getAllLivematches() async {
    try {
      var response = await apiManger.getRequestFootballApi(
          endPoints: EndPoints.liveAllMatchesEndPoint,
          queryParameters: {
            "live": "all",
          });
      LiveMatchesResponse liveMatchesResponse =
          LiveMatchesResponse.fromJson(response.data);
      List<Response> listLiveMatches = liveMatchesResponse.response ?? [];
      log('listLiveMatches: $listLiveMatches ');
      return Left(listLiveMatches);
    } catch (error) {
      log('error: $error');
      return Right(error.toString());
    }
  }
}
