import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());
  
  HomeRepo homeRepo;
  Future<void> fetchSimilarBooks() async {
    emit(SimilarBookLoading());
    var result = await homeRepo.fetchSimilarBooks(category: '');
    result.fold(
      (failure) {
        emit(
          SimilarBookFailure(errMessage: failure.errMessage),
        );
      },
      (books) {
        emit(
          SimilarBookSuccess(books: books),
        );
      },
    );
  }
}
