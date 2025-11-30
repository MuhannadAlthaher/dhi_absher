import 'package:dhi_absher/src/login/widget/login_headr.dart';
import 'package:dhi_absher/src/them/them.dart';
import 'package:dhi_absher/src/login/widget/login_card.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/src/homescrean/home_screan.dart';



class LoginScrean extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const LoginScrean({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<LoginScrean> createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  bool rememberMe = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

void _onLoginPressed() {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute<void>(
      builder: (context) => HomeScrean(
        isDark: widget.isDark,
        onThemeChanged: widget.onThemeChanged,
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(
              isDark: isDark,
              onThemeChanged: widget.onThemeChanged,
            ),
            Transform.translate(
              offset: const Offset(0, -70),
              child: LoginCard(
                rememberMe: rememberMe,
                onRememberChanged: (v) {
                  setState(() => rememberMe = v ?? false);
                },
                usernameController: _usernameController,
                passwordController: _passwordController,
                onLoginPressed: _onLoginPressed,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
