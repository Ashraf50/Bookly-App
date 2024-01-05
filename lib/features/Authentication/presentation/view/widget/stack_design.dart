import 'package:flutter/material.dart';

class StackDesign extends StatelessWidget {
  const StackDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: [
        Positioned(
          left: -315,
          top: -560,
          child: CircleAvatar(
            backgroundColor: Color(0xffEF8262),
            maxRadius: 400,
          ),
        ),
      ]),
    );
  }
}
