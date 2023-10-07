import 'dart:math';

import 'package:book_app/constants.dart';
import 'package:book_app/core/utilities/app_router.dart';
import 'package:book_app/core/utilities/assets_data.dart';
import 'package:book_app/features/Splash/presentation/views/widget/sliding_texr.dart';
import 'package:book_app/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initialSlidingAnimation();
    navagationToHome_Transition();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsDate.logo),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initialSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animationController.forward();
    slidingAnimation = Tween<Offset>(begin: Offset(0, 20), end: Offset(0, 0))
        .animate(animationController);
  }

  void navagationToHome_Transition() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      GoRouter.of(context).push(AppRouter.kHomeScreen);
    });
  }
}
