import 'package:book_app/core/Utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffEF8262),
          ),
          child: Center(
            child: Text(
              title,
              style: Styles.textStyle18.copyWith(fontSize: 21),
            ),
          ),
        ),
      ),
    );
  }
}
