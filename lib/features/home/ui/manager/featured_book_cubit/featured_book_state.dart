import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class FeaturedBookState {}

final class FeaturedBookStateInitial extends FeaturedBookState {}

final class FeaturedBookStateLoading extends FeaturedBookState {}

final class FeaturedBookStateSuccess extends FeaturedBookState {
  final List<BookEntity> books;
  FeaturedBookStateSuccess(this.books);
}

final class FeaturedBookStateError extends FeaturedBookState {
  final String message;
  FeaturedBookStateError(this.message);
}

final class FeaturedBookPaginationLoading extends FeaturedBookState {}

final class FeaturedBookPaginationFailure extends FeaturedBookState {
  final String message;
  FeaturedBookPaginationFailure(this.message);
}
