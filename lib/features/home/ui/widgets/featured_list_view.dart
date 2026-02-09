import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/ui/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(detailsView, extra: 'featured$index');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomBookImage(tag: 'featured$index'),
            ),
          );
        },
      ),
    );
  }
}
