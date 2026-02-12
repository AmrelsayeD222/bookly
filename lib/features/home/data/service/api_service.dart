import 'package:bookly/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = baseURL;
    _dio.options.queryParameters = {"key": apiKey};
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data;
  }
}
