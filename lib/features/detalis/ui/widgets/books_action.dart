import 'package:bookly/core/widgets/url_luncher.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          book.previewLink != null
              ? Expanded(
                  child: CustomButton(
                    onPressed: () {
                      launchCustomUrl(context, book.previewLink);
                    },
                    fontSize: 16,
                    text: 'Preview',
                    backgroundColor: Color(0xffEF8262),
                    textColor: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                )
              : Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    fontSize: 12,
                    text: 'No Preview Available',
                    backgroundColor: Color(0xffEF8262),
                    textColor: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
