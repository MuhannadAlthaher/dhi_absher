import 'package:dhi_absher/src/login/constant/constant.dart';
import 'package:dhi_absher/src/them/them.dart';
import 'package:dhi_absher/src/login/widget/LoginTextField.dart';
import 'package:flutter/material.dart';



class LoginCard extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberChanged;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;

  const LoginCard({
    super.key,
    required this.rememberMe,
    required this.onRememberChanged,
    required this.usernameController,
    required this.passwordController,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: LoginDimensions.cardWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        color: AppColors.secondaryGreen,
        borderRadius: BorderRadius.all(
          Radius.circular(LoginDimensions.cardRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Text(
              LoginTexts.usernameLabel,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          LoginTextField(
            controller: usernameController,
            hintText: LoginTexts.usernameHint,
            obscureText: false,
          ),
          const SizedBox(height: 25),
          const Center(
            child: Text(
              LoginTexts.passwordLabel,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          LoginTextField(
            controller: passwordController,
            hintText: LoginTexts.passwordHint,
            obscureText: true,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                LoginTexts.rememberMe,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 5),
              Checkbox(
                value: rememberMe,
                onChanged: onRememberChanged,
                activeColor: Colors.white,
                checkColor: Colors.green,
                side: const BorderSide(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: onLoginPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cardOverlay,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    LoginDimensions.fieldRadius,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
              ),
              child: const Text(
                LoginTexts.loginButton,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
