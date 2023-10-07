import 'package:book_app/core/utilities/api_service.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      ApiService(
        Dio(),
      ),
    ),
  );
}
