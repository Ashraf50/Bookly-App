import 'package:book_app/core/Utils/text_style.dart';
import 'package:book_app/features/home/presentation/View/widget/newest_book_list_view.dart';
import 'package:book_app/features/home/presentation/View/widget/custom_appbar.dart';
import 'package:book_app/features/home/presentation/View/widget/book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(

      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(),
              BookListView(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Newest Books",
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: NewestBookListView(),
        )
      ],
    );
  }
}
