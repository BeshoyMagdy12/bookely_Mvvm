import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getSimilerBooks({required String category}) async {
    emit(SimilerBookLoding());
    var res = await homeRepo.fetchsimilerBooks(category: category);
    res.fold(
      (failure) => emit(SimilerBookFailure(failure.errMessage)),
      (seccsus) => emit(
        SimilerBookSuccess(seccsus),
      ),
    );
  }
}
