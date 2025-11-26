import 'package:flutter/material.dart';

class LoginScrean extends StatefulWidget {
  const LoginScrean({super.key});

  @override
  State<LoginScrean> createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff025035),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Absher.png', height: 80),
                  const SizedBox(height: 20),
                  const Text(
                    "بَصير",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "قارئ الهوية الصحية الرقمية",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
      
            Transform.translate(
              offset: const Offset(0, -100),
              child: Container(
                width: 339,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: const BoxDecoration(
                  color: Color(0xff156B40),
                  borderRadius: BorderRadius.all(
                    Radius.circular(36),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // USERNAME LABEL
                    const Center(
                      child: Text(
                        "اسم المستخدم",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
      
                    const SizedBox(height: 10),
      
                    // USERNAME FIELD
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0x40FFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "ادخل اسم المستخدم",
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
      
                    const SizedBox(height: 25),
      
                    // PASSWORD LABEL
                    const Center(
                      child: Text(
                        "كلمة السر",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
      
                    const SizedBox(height: 10),
      
                    // PASSWORD FIELD
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0x40FFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "ادخل كلمة السر",
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
      
                    const SizedBox(height: 15),
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "تذكرني",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 5),
                        Checkbox(
                          value: rememberMe,
                          onChanged: (v) {
                            setState(() {
                              rememberMe = v ?? false;
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: Colors.green,
                          side: const BorderSide(color: Colors.white),
                        ),
                      ],
                    ),
      
                    const SizedBox(height: 15),
      
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint("Remember Me Status: $rememberMe");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x90FFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 15,
                          ),
                        ),
                        child: const Text(
                          'تسجيل الدخول',
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
              ),
            ),
      
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
