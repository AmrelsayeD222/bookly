import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/model/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks({
    required String category,
  });
}
