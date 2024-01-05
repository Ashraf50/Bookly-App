import 'package:book_app/core/Utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  final dynamic avgRating;
  final MainAxisAlignment mainAxisAlignment;

  const RatingWidget(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.avgRating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        SvgPicture.asset("assets/img/Star.svg", height: 18),
        const SizedBox(
          width: 10,
        ),
        Text(
          "$avgRating",
          style: Styles.textStyle18,
        ),
        const SizedBox(
          width: 8,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "$rating",
            style: Styles.textStyle14,
          ),
        )
      ],
    );
  }
}
