import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(errMessage: failure.errMessage),
        );
      },
      (books) {
        emit(
          FeaturedBooksSuccess(book: books),
        );
      },
    );
  }
}
