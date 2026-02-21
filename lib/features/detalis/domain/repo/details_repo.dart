import 'package:bookly/core/network/error/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  });
}
