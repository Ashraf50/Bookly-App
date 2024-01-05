import 'package:book_app/core/widget/custom_error_message.dart';
import 'package:book_app/core/widget/fetchured_loading.dart';
import 'package:book_app/features/home/presentation/View/widget/book_item.dart';
import 'package:book_app/features/home/presentation/View/widget/details_view_body.dart';
import 'package:book_app/features/home/presentation/view_model/featured_book_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.width * 0.5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.book.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(DetailsViewBody(
                      model: state.book[index],
                    ));
                  },
                  child: BookItem(
                    imgUrl: state.book[index].volumeInfo.imageLinks?.thumbnail?? "",
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const FetchedLoading();
        }
      },
    );
  }
}
