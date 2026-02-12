import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/model/books_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Item>>> fetchNewsetBooks();
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({
    required String category,
  });
}
