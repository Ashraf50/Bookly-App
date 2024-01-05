import 'package:book_app/features/Authentication/presentation/view/sign_in_view.dart';
import 'package:book_app/features/Authentication/presentation/view/widget/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              title: "SignOut",
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.to(const SignInView());
              })
        ],
      ),
    );
  }
}
