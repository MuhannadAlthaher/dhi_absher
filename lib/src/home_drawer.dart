
import 'package:dhi_absher/src/login_screan.dart';
import 'package:flutter/material.dart';

class home_drawer extends StatelessWidget {
  const home_drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF202426),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
    
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF202426),
                ),
              ),
              const SizedBox(height: 16),
    
              const Text(
                ':المسعف',
                style: TextStyle(
                  color: Color(0xff00A86B),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
    
              const Text(
                'احمد الشمري',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
    
              const Text(
                'ID: 212212123',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
    
              const SizedBox(height: 40),
    
              Image.asset(
                'assets/Absher_logo.png',
                height: 90,
                fit: BoxFit.contain,
              ),
    
              const SizedBox(height: 50),
    
              Image.asset(
                'assets/Saudi_Ministry_of_Health_Logo.png',
                height: 90,
                fit: BoxFit.contain,
              ),
    
              const Spacer(),
              const SizedBox(height: 24),
    
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                                               Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
    builder: (context) => const LoginScrean(),
        ),
      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00A86B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
    
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
