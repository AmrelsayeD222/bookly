import 'package:bookly/features/detalis/ui/widgets/books_details_section.dart';
import 'package:bookly/features/detalis/ui/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/detalis/ui/widgets/similar_books_section.dart';
import 'package:bookly/features/home/data/model/books_model/item.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.book, required this.tag});

  final Item book;
  final String tag;
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
                    BookDetailsSection(book: book, tag: tag),
                    Expanded(child: SizedBox(height: 50)),
                    SimilarBooksSection(),
                    SizedBox(height: 40),
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
