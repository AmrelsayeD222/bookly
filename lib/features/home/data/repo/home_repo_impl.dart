import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/data/model/books_model/books_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:bookly/features/home/data/service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(endPoint: newestEndPoint);
      List<BooksModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BooksModel.fromJson(item));
        } catch (e) {
          books.add(BooksModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: featuresdEndPoint);
      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(endPoint: similarBooksEndPoint);
      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
