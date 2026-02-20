import 'package:bookly/features/detalis/ui/widgets/books_details_section.dart';
import 'package:bookly/features/detalis/ui/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/detalis/ui/widgets/similar_books_section.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.tag, required this.book});

  final String tag;
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
