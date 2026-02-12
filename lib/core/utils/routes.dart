import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/detalis/ui/view/details_view.dart';
import 'package:bookly/features/home/data/model/books_model/item.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/ui/manager/smila_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/ui/views/home_view.dart';
import 'package:bookly/features/search/ui/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: homeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: detailsView,
      builder: (BuildContext context, GoRouterState state) {
        final book = state.extra as Item;

        return BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchSimilarBooks(category: book.volumeInfo?.categories?[0] ?? ''),
          child: DetailsView(book: book),
        );
      },
    ),
    GoRoute(
      path: searchView,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchView();
      },
    ),
  ],
);
