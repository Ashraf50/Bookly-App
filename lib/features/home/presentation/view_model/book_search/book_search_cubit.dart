import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_search_state.dart';

class BookSearchCubit extends Cubit<BookSearchState> {
  BookSearchCubit(this.homeRepo) : super(BookSearchInitial());
  final HomeRepo homeRepo;

  Future<void> fetchBookSearch( String title) async {
    emit(BookSearchLoading());
    var result = await homeRepo.fetchBookSearch(title: title);
    result.fold(
      (failure) {
        emit(
          BookSearchFailure(errMessage: failure.errMessage),
        );
      },
      (books) {
        emit(
          BookSearchSuccess(books: books),
        );
      },
    );
  }
}

