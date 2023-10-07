import 'package:book_app/core/utilities/service_locator.dart';
import 'package:book_app/features/Splash/presentation/views/splash_view.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/view/book_details_view.dart';
import 'package:book_app/features/home/presentation/view/home_screen.dart';
import 'package:book_app/features/home/presentation/view_model/similer_books/similer_books_cubit.dart';
import 'package:book_app/features/search/presentation/view/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeScreen = '/homescreen';
  static const kBookDetalisView = '/bookdetalisscreen';
  static const kSrearch = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kBookDetalisView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilerBooksCubit(getIt.get<HomeRepoImplement>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSrearch,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
