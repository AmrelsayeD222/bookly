import 'package:bookly/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options.baseUrl = baseURL;
    dio.options.queryParameters = {"key": dotenv.env['GOOGLE_BOOKS_API_KEY']};
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(endPoint);
    return response.data;
  }
}
