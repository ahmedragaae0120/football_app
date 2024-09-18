import 'package:dio/dio.dart';
import 'package:football_app/core/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManger {
  static late Dio dio;
  static late Dio dio2;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.footballApiBaseUrl,
        headers: {
          "x-rapidapi-key": Constants.footballapiKey,
        },
      ),
    );

    dio2 = Dio(BaseOptions(
      baseUrl: Constants.newsApiBaseUrl,
      validateStatus: (status) {
        if (status.hashCode == 426) {
          return false;
        }
        return status! < 500;
      },
    ));
  }

  Future<Response> getRequestFootballApi(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> getRequestNewsApi(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dio2.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> postRequest(
      {required String endPoints, Map<String, dynamic>? body}) async {
    var response = await dio.post(endPoints, data: body);
    return response;
  }
}
