import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/books_model/item.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    if (isClosed) return;
    result.fold(
      (failure) {
        emit(NewsetBooksFailure(failure.errMessage));
      },
      (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}
