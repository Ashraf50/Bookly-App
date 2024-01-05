import 'package:book_app/features/Authentication/presentation/view/widget/sign_in_form.dart';
import 'package:book_app/features/Authentication/presentation/view/widget/stack_design.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              StackDesign(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SignInForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
