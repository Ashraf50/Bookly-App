import 'package:book_app/core/Utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        validator: validator,
        autovalidateMode: autovalidateMode,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: Styles.textStyle20.copyWith(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red),
            )),
      ),
    );
  }
}
