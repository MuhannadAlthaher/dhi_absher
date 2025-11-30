import 'package:dhi_absher/src/login/constant/constant.dart';
import 'package:dhi_absher/src/them/them.dart';
import 'package:flutter/material.dart';


class LoginHeader extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const LoginHeader({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LoginDimensions.headerHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(LoginDimensions.headerRadius),
          bottomRight: Radius.circular(LoginDimensions.headerRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.light_mode, color: Colors.white),
                  Switch(
                    value: isDark,
                    onChanged: onThemeChanged,
                    activeColor: Colors.white,
                  ),
                  const Icon(Icons.dark_mode, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Image.asset('assets/Absher.png', height: 80),
          const SizedBox(height: 20),
          const Text(
            LoginTexts.appName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            LoginTexts.appSubtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
