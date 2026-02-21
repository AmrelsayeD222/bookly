import 'package:bookly/features/home/domain/use_cases/fetch_featured_use_case.dart';
import 'package:bookly/features/home/ui/manager/featured_book_cubit/featured_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FetchFeaturedBooksUseCase featuredBookUseCase;
  FeaturedBookCubit(this.featuredBookUseCase)
    : super(FeaturedBookStateInitial());

  int pageNumber = 0;
  List<BookEntity> books = [];

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBookStateLoading());
    } else {
      emit(FeaturedBookPaginationLoading());
    }

    final result = await featuredBookUseCase.call(pageNumber);
    if (isClosed) return;

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBookStateError(failure.errorMessage));
        } else {
          emit(FeaturedBookPaginationFailure(failure.errorMessage));
        }
      },
      (newBooks) {
        if (pageNumber == 0) {
          books = newBooks;
        } else {
          books.addAll(newBooks);
        }
        emit(FeaturedBookStateSuccess(books));
      },
    );
  }
}
