import 'package:book_app/core/widget/custom_error_message.dart';
import 'package:book_app/core/widget/newest_loading.dart';
import 'package:book_app/features/home/presentation/View/widget/details_view_body.dart';
import 'package:book_app/features/home/presentation/View/widget/newest_book_item.dart';
import 'package:book_app/features/home/presentation/view_model/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class NewestBookListView extends StatelessWidget {
  const NewestBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Get.to(DetailsViewBody(model: state.books[index]));
                  },
                  child: NewestBookItem(bookModel: state.books[index]),
                ),
              );
            },
          );
        } else if (state is NewestBookFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const NewestLoading();
        }
      },
    );
  }
}
