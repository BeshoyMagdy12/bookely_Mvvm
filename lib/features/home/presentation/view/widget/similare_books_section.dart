import 'package:book_app/core/utilities/styles.dart';
import 'package:book_app/features/home/presentation/view/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilareBooksSection extends StatelessWidget {
  const SimilareBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'you can also like',
          style: Styles.textstyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBookListView(),
      ],
    );
  }
}
