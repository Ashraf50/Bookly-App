import 'package:book_app/core/Utils/text_style.dart';
import 'package:flutter/widgets.dart';

class CustomErrorMessage extends StatelessWidget {
  final String errMessage;
  const CustomErrorMessage({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: Styles.textStyle16,
    );
  }
}
