import 'package:book_app/core/widget/custom_err.dart';
import 'package:book_app/core/widget/custom_loding_indicator.dart';
import 'package:book_app/features/home/presentation/view/widget/list_view_best_seller_item.dart';
import 'package:book_app/features/home/presentation/view_model/newset_book_cubit/newset_books_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewSetBookSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewSetBookFailure) {
          return CustomError(errMessage: state.errMessege);
        } else {
          return const CustomLodingIndicator();
        }
      },
    );
  }
}
