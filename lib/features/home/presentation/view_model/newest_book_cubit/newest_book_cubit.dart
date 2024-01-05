import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());

  HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(
          NewestBookFailure(errMessage: failure.errMessage),
        );
      },
      (books) {
        emit(
          NewestBookSuccess(books: books),
        );
      },
    );
  }
}
