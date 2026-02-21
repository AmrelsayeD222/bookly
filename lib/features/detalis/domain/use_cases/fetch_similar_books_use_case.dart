import 'package:bookly/core/network/error/failure.dart';
import 'package:bookly/core/use_cases/with_param_use_case.dart';
import 'package:bookly/features/detalis/domain/repo/details_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase
    extends WithParamUseCase<List<BookEntity>, String> {
  final DetailsRepo detailsRepo;

  FetchSimilarBooksUseCase(this.detailsRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(String param) async {
    return await detailsRepo.fetchSimilarBooks(category: param);
  }
}
