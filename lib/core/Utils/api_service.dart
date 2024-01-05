import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    String baseUrl = "https://www.googleapis.com/books/v1/";
    Response response = await _dio.get("$baseUrl$endPoint");

    return response.data;
  }
}
