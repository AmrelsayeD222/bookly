import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class NewestBookState {}

final class NewestBookStateInitial extends NewestBookState {}

final class NewestBookStateLoading extends NewestBookState {}

final class NewestBookStatePaginationLoading extends NewestBookState {}

final class NewestBookStateSuccess extends NewestBookState {
  final List<BookEntity> books;
  NewestBookStateSuccess(this.books);
}

final class NewestBookStateError extends NewestBookState {
  final String message;
  NewestBookStateError(this.message);
}

final class NewestBookStatePaginationError extends NewestBookState {
  final String message;
  NewestBookStatePaginationError(this.message);
}
