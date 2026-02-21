import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_book.dart';
import 'package:bookly/features/home/ui/manager/newest_book_cubit/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  FetchNewestBookUseCase newestBookUseCase;
  NewestBookCubit(this.newestBookUseCase) : super(NewestBookStateInitial());
  int pageNumber = 0;
  List<BookEntity> books = [];

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBookStateLoading());
    } else {
      emit(NewestBookStatePaginationLoading());
    }
    final result = await newestBookUseCase.call(pageNumber);
    if (isClosed) return;

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBookStateError(failure.errorMessage));
        } else {
          emit(NewestBookStatePaginationError(failure.errorMessage));
        }
      },
      (newBooks) {
        if (pageNumber == 0) {
          books = newBooks;
        } else {
          books.addAll(newBooks);
        }
        emit(NewestBookStateSuccess(books));
      },
    );
  }
}
