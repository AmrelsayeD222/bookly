import 'package:bookly/features/detalis/ui/widgets/books_details_section.dart';
import 'package:bookly/features/detalis/ui/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/detalis/ui/widgets/similar_books_section.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/detalis/ui/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/detalis/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/core/utils/function/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.tag, required this.book});

  final String tag;
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SimilarBooksCubit(getIt<FetchSimilarBooksUseCase>())
            ..fetchSimilarBooks(category: book.title),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const CustomBookDetailsAppBar(),
                      BookDetailsSection(tag: tag, book: book),
                      const Expanded(child: SizedBox(height: 50)),
                      const SimilarBooksSection(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
