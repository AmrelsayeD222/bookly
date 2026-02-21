import 'package:bookly/core/network/error/failure.dart';
import 'package:bookly/core/use_cases/with_param_use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBookUseCase extends WithParamUseCase<List<BookEntity>, int> {
  final HomeRepo repo;
  FetchNewestBookUseCase(this.repo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await repo.fetchNewestBooks(pageNumber: param);
  }
}
