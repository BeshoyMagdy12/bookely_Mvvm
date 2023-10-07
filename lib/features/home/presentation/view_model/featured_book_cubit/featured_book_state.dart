part of 'featured_book_cubit.dart';

abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;

  const FeaturedBookSuccess(this.books);
}

class FeaturedBookLoding extends FeaturedBookState {}

class FeaturedBookFailure extends FeaturedBookState {
  final String errMessege;

  const FeaturedBookFailure(this.errMessege);
}
