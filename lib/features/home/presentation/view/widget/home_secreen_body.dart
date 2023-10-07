import 'package:book_app/constants.dart';
import 'package:book_app/core/utilities/assets_data.dart';
import 'package:book_app/core/utilities/styles.dart';
import 'package:book_app/features/home/presentation/view/widget/best_seller_list_view.dart';
import 'package:book_app/features/home/presentation/view/widget/custom_abb_bar.dart';
import 'package:book_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:book_app/features/home/presentation/view/widget/feature_list_view_item.dart';
import 'package:book_app/features/home/presentation/view/widget/list_view_best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAbbBar(),
              ),
              FeatureListViewItem(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textstyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: BookListViewItem(),
          ),
        )
      ],
    );
  }
}
