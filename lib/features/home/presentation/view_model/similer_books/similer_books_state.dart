part of 'similer_books_cubit.dart';

abstract class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

class SimilerBooksInitial extends SimilerBooksState {}

class SimilerBookSuccess extends SimilerBooksState {
  final List<BookModel> books;

  const SimilerBookSuccess(this.books);
}

class SimilerBookLoding extends SimilerBooksState {}

class SimilerBookFailure extends SimilerBooksState {
  final String errMessege;

  const SimilerBookFailure(this.errMessege);
}
