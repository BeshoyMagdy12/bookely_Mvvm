import 'package:book_app/constants.dart';
import 'package:book_app/core/utilities/api_service.dart';
import 'package:book_app/core/utilities/app_router.dart';
import 'package:book_app/core/utilities/service_locator.dart';
import 'package:book_app/features/Splash/presentation/views/splash_view.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/view_model/featured_book_cubit/featured_book_cubit.dart';
import 'package:book_app/features/home/presentation/view_model/newset_book_cubit/newset_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  setupServiceLocator();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchFeattureBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            getIt.get<HomeRepoImplement>(),
          )..getNewSetBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
  /*
   service_locator
  */
}
