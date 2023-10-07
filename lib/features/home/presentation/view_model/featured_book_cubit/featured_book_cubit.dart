import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;
  Future<void> fetchFeattureBooks() async {
    emit(FeaturedBookLoding());
    var result = await homeRepo.fetchBestFeatureBooks();
    result.fold(
      (failure) => emit(
        FeaturedBookFailure(failure.errMessage),
      ),
      (books) => emit(
        FeaturedBookSuccess(books),
      ),
    );
  }
}
