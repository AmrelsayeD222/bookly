import 'package:bookly/core/network/services/api_service.dart';
import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_book.dart';
import 'package:bookly/features/detalis/data/data_source/details_remote_data_source.dart';
import 'package:bookly/features/detalis/data/repo/details_repo_impl.dart';
import 'package:bookly/features/detalis/domain/repo/details_repo.dart';
import 'package:bookly/features/detalis/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      localDataSource: HomeLocalDataSourceImpl(),
      remoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt<ApiService>(),
      ),
    ),
  );
  getIt.registerLazySingleton<FetchFeaturedBooksUseCase>(
    () => FetchFeaturedBooksUseCase(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchNewestBookUseCase>(
    () => FetchNewestBookUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<DetailsRepo>(
    DetailsRepoImpl(
      remoteDataSource: DetailsRemoteDataSourceImpl(
        apiService: getIt<ApiService>(),
      ),
    ),
  );
  getIt.registerLazySingleton<FetchSimilarBooksUseCase>(
    () => FetchSimilarBooksUseCase(getIt<DetailsRepo>()),
  );
}
