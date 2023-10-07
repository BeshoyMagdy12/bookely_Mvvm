import 'package:book_app/core/utilities/app_router.dart';
import 'package:book_app/core/utilities/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAbbBar extends StatelessWidget {
  const CustomAbbBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AssetsDate.logo,
              height: 19,
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSrearch);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
