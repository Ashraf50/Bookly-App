import 'package:book_app/core/Utils/text_style.dart';
import 'package:book_app/features/home/presentation/View/widget/details_custom_button.dart';
import 'package:flutter/material.dart';

class DetailsButtonAction extends StatelessWidget {
  final Function()? previewOnTap;
  final Function()? downloadOnTap;

  const DetailsButtonAction({super.key, required this.downloadOnTap,required this.previewOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailsCustomButton(
            onTap: downloadOnTap,
            title: "Download",
            color: Colors.white,
            style: Styles.textStyle18.copyWith(color: Colors.black),
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)))),
          ),
          DetailsCustomButton(
            onTap: previewOnTap,
            title: "Free Preview",
            color: const Color(0xffEF8262),
            style: Styles.textStyle16.copyWith(color: Colors.white),
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)))),
          ),
        ],
      ),
    );
  }
}
