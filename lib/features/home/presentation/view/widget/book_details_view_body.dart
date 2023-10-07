import 'package:book_app/core/utilities/assets_data.dart';
import 'package:book_app/core/utilities/styles.dart';
import 'package:book_app/core/widget/custom_button.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widget/book_details_section.dart';
import 'package:book_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:book_app/features/home/presentation/view/widget/books_action_button.dart';
import 'package:book_app/features/home/presentation/view/widget/custom_book_details_app_bar.dart';
import 'package:book_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:book_app/features/home/presentation/view/widget/similar_books_list_view.dart';
import 'package:book_app/features/home/presentation/view/widget/similare_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetalisAppBar(),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilareBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
