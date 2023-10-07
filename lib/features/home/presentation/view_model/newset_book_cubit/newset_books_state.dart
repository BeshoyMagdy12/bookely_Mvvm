part of 'newset_books_cubit.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

class NewsetBooksInitial extends NewsetBooksState {}

class NewSetBookSuccess extends NewsetBooksState {
  final List<BookModel> books;

  const NewSetBookSuccess(this.books);
}

class NewSetBookLoding extends NewsetBooksState {}

class NewSetBookFailure extends NewsetBooksState {
  final String errMessege;

  const NewSetBookFailure(this.errMessege);
}
