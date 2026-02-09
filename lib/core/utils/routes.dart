import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/detalis/ui/view/details_view.dart';
import 'package:bookly/features/home/ui/views/home_view.dart';
import 'package:bookly/features/search/ui/view/search_view.dart';
import 'package:flutter/material.dart';
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
        final tag = state.extra as String;
        return DetailsView(tag: tag);
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
