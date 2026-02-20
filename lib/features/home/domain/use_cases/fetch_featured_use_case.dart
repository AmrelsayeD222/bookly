import 'package:bookly/core/network/error/failure.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends NoParamUseCase<List<BookEntity>> {
  final HomeRepo repo;
  FetchFeaturedBooksUseCase(this.repo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await repo.fetchFeaturedBooks();
  }
}
