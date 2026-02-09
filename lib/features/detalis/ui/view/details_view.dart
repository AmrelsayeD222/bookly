import 'package:bookly/features/detalis/ui/widgets/books_details_section.dart';
import 'package:bookly/features/detalis/ui/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/detalis/ui/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomBookDetailsAppBar(),
                    BookDetailsSection(),
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
