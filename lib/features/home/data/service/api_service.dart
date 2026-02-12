import 'package:bookly/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = baseURL;
    _dio.options.queryParameters = {"key": dotenv.env['GOOGLE_BOOKS_API_KEY']};
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data;
  }
}
