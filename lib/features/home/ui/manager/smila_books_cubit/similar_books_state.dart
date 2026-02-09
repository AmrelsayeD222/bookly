part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {
  const SimilarBooksState();
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BooksModel> books;

  const SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}
