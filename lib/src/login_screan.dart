import 'package:flutter/material.dart';

class LoginScrean extends StatelessWidget {
  const LoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff1A1A1A),
      body: Column(
        children: [
          Container(
            height: 375,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)
              ),
              color: Color(0xff025035)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Absher.png'),
              ],
          ),
          ),

        ],
      ),
    );
  }
}