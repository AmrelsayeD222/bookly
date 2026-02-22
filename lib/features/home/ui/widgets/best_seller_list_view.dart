import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/ui/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly/features/home/ui/manager/newest_book_cubit/newest_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookStateSuccess ||
            state is NewestBookStatePaginationLoading ||
            state is NewestBookStatePaginationError) {
          final books = BlocProvider.of<NewestBookCubit>(context).books;
          return SliverList.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: BestSellerListViewItem(
                  book: books[index],
                  tag: 'bestSeller$index',
                ),
              );
            },
          );
        } else if (state is NewestBookStateError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.message),
          );
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
