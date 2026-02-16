import 'package:bookly/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NoParamUseCase<T> {
  Future<Either<Failure, T>> call();
}
