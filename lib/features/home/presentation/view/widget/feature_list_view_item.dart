import 'package:book_app/core/utilities/app_router.dart';
import 'package:book_app/core/utilities/assets_data.dart';
import 'package:book_app/core/widget/custom_err.dart';
import 'package:book_app/core/widget/custom_loding_indicator.dart';
import 'package:book_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:book_app/features/home/presentation/view_model/featured_book_cubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureListViewItem extends StatelessWidget {
  const FeatureListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetalisView,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            "https://www.shutterstock.com/image-vector/flat-line-icon-concept-404-600w-644143258.jpg"
                                ''),
                  ),
                );
              },
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomError(
            errMessage: state.errMessege,
          );
        } else {
          return const CustomLodingIndicator();
        }
      },
    );
  }
}
