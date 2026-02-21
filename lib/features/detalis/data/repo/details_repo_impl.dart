import 'package:bookly/core/network/error/failure.dart';
import 'package:bookly/features/detalis/data/data_source/details_remote_data_source.dart';
import 'package:bookly/features/detalis/domain/repo/details_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DetailsRepoImpl extends DetailsRepo {
  final DetailsRemoteDataSource remoteDataSource;

  DetailsRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var books = await remoteDataSource.fetchSimilarBooks(category: category);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
