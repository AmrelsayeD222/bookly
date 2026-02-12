import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/data/model/books_model/item.dart';
import 'package:bookly/features/home/ui/widgets/book_rating.dart';
import 'package:bookly/features/home/ui/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({
    super.key,
    required this.book,
    required String tag,
  });

  final Item book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(detailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.volumeInfo!.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: gtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    book.volumeInfo!.authors?[0] ?? '',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: book.volumeInfo!.averageRating ?? 0,
                        count: book.volumeInfo!.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
