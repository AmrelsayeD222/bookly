import 'package:bookly/features/home/domain/use_cases/fetch_newest_book.dart';
import 'package:bookly/features/home/ui/manager/newest_book_cubit/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  FetchNewestBookUseCase newestBookUseCase;
  NewestBookCubit(this.newestBookUseCase) : super(NewestBookStateInitial());
  Future<void> fetchNewestBooks() async {
    emit(NewestBookStateLoading());
    final result = await newestBookUseCase.call();
    if (isClosed) return;

    result.fold(
      (failure) {
        emit(NewestBookStateError(failure.errorMessage));
      },
      (books) {
        emit(NewestBookStateSuccess(books));
      },
    );
  }
}
