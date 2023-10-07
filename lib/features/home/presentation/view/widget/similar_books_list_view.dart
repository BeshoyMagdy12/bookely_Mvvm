import 'package:book_app/core/utilities/assets_data.dart';
import 'package:book_app/core/widget/custom_err.dart';
import 'package:book_app/core/widget/custom_loding_indicator.dart';
import 'package:book_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:book_app/features/home/presentation/view_model/similer_books/similer_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
      builder: (context, state) {
        if (state is SimilerBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo.imageLinks?.thumbnail ??
                          "https://www.shutterstock.com/image-vector/caution-exclamation-mark-white-red-260nw-1055269061.jpg"),
                );
              },
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is SimilerBookFailure) {
          return CustomError(errMessage: state.errMessege);
        } else {
          return const CustomLodingIndicator();
        }
      },
    );
  }
}
