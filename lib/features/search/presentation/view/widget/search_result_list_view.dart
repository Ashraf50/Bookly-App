import 'package:book_app/core/widget/custom_error_message.dart';
import 'package:book_app/features/home/presentation/View/widget/details_view_body.dart';
import 'package:book_app/features/home/presentation/View/widget/newest_book_item.dart';
import 'package:book_app/features/home/presentation/view_model/book_search/book_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchCubit, BookSearchState>(
      builder: (context, state) {
        if (state is BookSearchSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap: (){
                    Get.to(DetailsViewBody(model: state.books[index]));
                  },
                  child: NewestBookItem(
                    bookModel: state.books[index],
                  ),
                ),
              );
            },
          );
        } else if (state is BookSearchFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const SpinKitPulsingGrid(
            color: Colors.white,
            size: 100.0,
          );
        }
      },
    );
  }
}
