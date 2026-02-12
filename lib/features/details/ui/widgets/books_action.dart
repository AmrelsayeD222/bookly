import 'package:bookly/core/functions/lunch_url.dart';
import 'package:bookly/features/home/data/model/books_model/item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
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
          (book.volumeInfo?.previewLink != null)
              ? Expanded(
                  child: CustomButton(
                    onPressed: () async {
                      await lunchUrl(book.volumeInfo!.previewLink!, context);
                    },
                    fontSize: 16,
                    text: 'Preview',
                    backgroundColor: const Color(0xffEF8262),
                    textColor: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                )
              : Expanded(
                  child: CustomButton(
                    fontSize: 16,
                    text: 'Preview Not Avaliable',
                    backgroundColor: const Color(0xffEF8262),
                    textColor: Colors.white,
                    borderRadius: const BorderRadius.only(
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
