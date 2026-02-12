import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/data/model/books_model/item.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:bookly/features/home/data/service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(endPoint: newestEndPoint);

      return right(_getBooksList(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: featuredEndPoint);

      return right(_getBooksList(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(endPoint: '$similarEndPoint$category');

      return right(_getBooksList(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  List<Item> _getBooksList(dynamic data) {
    List<Item> books = [];
    if (data['items'] != null) {
      for (var item in data['items']) {
        books.add(Item.fromJson(item));
      }
    }
    return books;
  }
}
