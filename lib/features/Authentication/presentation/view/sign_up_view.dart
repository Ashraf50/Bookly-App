import 'package:book_app/features/Authentication/presentation/view/widget/sign_up_form.dart';
import 'package:book_app/features/Authentication/presentation/view/widget/stack_design.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Color(0xffd7e5ff),
          body: Stack(
            children: [
              StackDesign(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SignUpForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
