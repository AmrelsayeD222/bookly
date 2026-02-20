import 'package:bookly/features/home/domain/use_cases/fetch_featured_use_case.dart';
import 'package:bookly/features/home/ui/manager/featured_book_cubit/featured_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FetchFeaturedBooksUseCase featuredBookUseCase;
  FeaturedBookCubit(this.featuredBookUseCase)
    : super(FeaturedBookStateInitial());
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookStateLoading());
    final result = await featuredBookUseCase.call();
    result.fold(
      (failure) {
        emit(FeaturedBookStateError(failure.errorMessage));
      },
      (books) {
        emit(FeaturedBookStateSuccess(books));
      },
    );
  }
}
