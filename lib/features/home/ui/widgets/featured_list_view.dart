import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/ui/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly/features/home/ui/manager/featured_book_cubit/featured_book_state.dart';
import 'package:bookly/features/home/ui/widgets/custom_book_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;
        final cubit = BlocProvider.of<FeaturedBookCubit>(context);
        cubit.fetchFeaturedBooks(pageNumber: cubit.pageNumber + 1);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookStateSuccess ||
            state is FeaturedBookPaginationFailure) {
          isLoading = false;
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookStateSuccess ||
            state is FeaturedBookPaginationLoading ||
            state is FeaturedBookPaginationFailure) {
          final books = BlocProvider.of<FeaturedBookCubit>(context).books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      detailsView,
                      extra: {'tag': 'featured$index', 'book': books[index]},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomBookImage(
                      tag: 'featured$index',
                      imageUrl: books[index].imageUrl ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookStateError) {
          return CustomErrorWidget(errorMessage: state.message);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
