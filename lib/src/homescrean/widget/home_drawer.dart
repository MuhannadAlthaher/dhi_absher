import 'package:dhi_absher/src/login/login_screan.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  const HomeDrawer({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF1B1D1F) 
              : const Color(0xFFF4F4F4),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),

              CircleAvatar(
                radius: 45,
                backgroundColor: isDark
                    ? Colors.white.withOpacity(0.12)
                    : Colors.black.withOpacity(0.08),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'المسعف',
                style: TextStyle(
                  color: Color(0xff00A86B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'أحمد الشمري',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 4),
              Text(
                'ID: 212212123',
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black54,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 45),

              // ------------------ Logos ------------------
              Image.asset(
                'assets/Absher_logo.png',
                height: 85,
                color: isDark ? Colors.white.withOpacity(.85) : Colors.black87,
              ),

              const SizedBox(height: 35),

              Image.asset(
                'assets/Saudi_Ministry_of_Health_Logo.png',
                height: 85,
                color: isDark ? Colors.white.withOpacity(.85) : Colors.black87,
              ),

              const SizedBox(height: 40),

              // ------------------ Dark Mode Switch ------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withOpacity(0.07)
                        : Colors.black.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الوضع الداكن",
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      Switch(
                        value: isDark,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0xff00A86B),
                        onChanged: onThemeChanged,
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // ------------------ Logout Button ------------------
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginScrean(
                            // تقدر هنا تتجاهل isDark أصلاً وتخلي اللوقن يعتمد على Theme
                            isDark: isDark,
                            onThemeChanged: onThemeChanged,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00A86B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
