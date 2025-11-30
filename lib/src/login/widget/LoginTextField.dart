import 'package:dhi_absher/src/login/constant/constant.dart';
import 'package:dhi_absher/src/them/them.dart';
import 'package:flutter/material.dart';



class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.cardOverlay,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(LoginDimensions.fieldRadius),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }
}
