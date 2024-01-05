import 'package:book_app/core/widget/custom_error_message.dart';
import 'package:book_app/features/home/presentation/View/widget/book_item.dart';
import 'package:book_app/features/home/presentation/view_model/similar_book_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailsBookListView extends StatelessWidget {
  const DetailsBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.3,
      child: BlocBuilder<SimilarBookCubit, SimilarBookState>(
        builder: (context, state) {
          if (state is SimilarBookSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BookItem(
                    imgUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            "");
              },
            );
          } else if (state is SimilarBookFailure) {
            return CustomErrorMessage(errMessage: state.errMessage);
          } else {
            return const SpinKitPulsingGrid(
              color: Colors.white,
              size: 100.0,
            );
          }
        },
      ),
    );
  }
}
