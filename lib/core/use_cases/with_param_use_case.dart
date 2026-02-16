import 'package:bookly/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class WithParamUseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
