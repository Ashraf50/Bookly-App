import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:book_app/core/Utils/text_style.dart';
import 'package:book_app/features/Authentication/presentation/view/widget/custom_button.dart';
import 'package:book_app/core/widget/custom_textfield.dart';
import 'package:book_app/core/widget/show_snack_bar.dart';
import 'package:book_app/features/Authentication/data/auth_bloc/auth_bloc.dart';
import 'package:book_app/features/Authentication/presentation/view/sign_in_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RegisterSuccess) {
          Get.to(const SignInView());
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.messageError);
        }
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Create\nAccount",
                      textStyle: Styles.textStyle30.copyWith(fontSize: 50),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextfield(
                validator: (p0) {
                  return null;
                },
                autovalidateMode: AutovalidateMode.disabled,
                hintText: 'Name',
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              CustomTextfield(
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? "Enter a valid email"
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Your Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              CustomTextfield(
                validator: (value) {
                  return value!.length < 6
                      ? "Enter at least 6 character"
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              CustomButton(
                  title: "SignUp",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    } else {
                      showSnackBar(context, "check the email or password");
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "already have an account?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                      child: const Text("signUp",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                      onPressed: () {
                        Get.to(const SignInView());
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
