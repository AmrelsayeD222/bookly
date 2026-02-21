import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/ui/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly/features/home/ui/manager/newest_book_cubit/newest_book_state.dart';
import 'package:bookly/features/home/ui/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/ui/widgets/custom_appbar.dart';
import 'package:bookly/features/home/ui/widgets/featured_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;
        final cubit = BlocProvider.of<NewestBookCubit>(context);
        cubit.fetchNewestBooks(pageNumber: cubit.pageNumber + 1);
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewestBookCubit, NewestBookState>(
      listener: (context, state) {
        if (state is NewestBookStateSuccess ||
            state is NewestBookStatePaginationError) {
          isLoading = false;
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: const [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: CustomAppBar(),
                  ),
                  FeaturedBooksListView(),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Best Seller', style: Styles.textStyle18),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            BestSellerListView(),
          ],
        ),
      ),
    );
  }
}
