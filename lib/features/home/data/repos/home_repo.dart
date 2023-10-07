import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewesttBooks();
  Future<Either<Failure, List<BookModel>>> fetchBestFeatureBooks();
  Future<Either<Failure, List<BookModel>>> fetchsimilerBooks(
      {required String category});
}
