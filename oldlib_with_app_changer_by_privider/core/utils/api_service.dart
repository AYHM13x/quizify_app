import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final _baseUrl = "https://quizapi.io/api/v1";

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$_baseUrl/$endPoint");

    return response.data;
  }
}
