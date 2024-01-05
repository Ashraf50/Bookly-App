import 'package:book_app/constant.dart';
import 'package:book_app/core/Utils/text_style.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/View/widget/rating_widget.dart';
import 'package:flutter/material.dart';

class NewestBookItem extends StatelessWidget {
  final BookModel bookModel;
  const NewestBookItem({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(bookModel.volumeInfo.imageLinks?.thumbnail ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  bookModel.volumeInfo.title!,
                  style: Styles.textStyle20.copyWith(
                    fontFamily: kGtSectraFine,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Opacity(
                opacity: 0.7,
                child: Text(
                  bookModel.volumeInfo.authors?[0] ?? "n",
                  style: Styles.textStyle16,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Free",
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RatingWidget(
                    avgRating: bookModel.volumeInfo.averageRating ?? 0,
                    rating: bookModel.volumeInfo.ratingsCount ?? 0,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
