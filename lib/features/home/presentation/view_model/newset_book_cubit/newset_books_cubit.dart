import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getNewSetBooks() async {
    emit(NewSetBookLoding());
    var result = await homeRepo.fetchNewesttBooks();

    result.fold(
      (failure) => emit(NewSetBookFailure(failure.errMessage)),
      (books) => emit(
        NewSetBookSuccess(books),
      ),
    );
  }
}
