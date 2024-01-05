import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:book_app/core/Utils/assets.dart';
import 'package:book_app/core/widget/bootom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetData.logo),
        const SizedBox(
          height: 4,
        ),
        AnimatedTextKit(animatedTexts: [
          TypewriterAnimatedText(
            "Read free books",
            textStyle: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ]),
      ],
    );
  }
}

void navigateToHome() {
  Future.delayed(const Duration(seconds: 2), () {
    Get.to(() => const BottomBar(),
        transition: Transition.leftToRightWithFade,
        duration: const Duration(milliseconds: 200));
  });
}
