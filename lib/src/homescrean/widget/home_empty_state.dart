import 'package:dhi_absher/src/homescrean/constant/constant.dart';
import 'package:flutter/material.dart';

class HomeEmptyState extends StatelessWidget {
  final VoidCallback onQrPressed;

  const HomeEmptyState({super.key, required this.onQrPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color primaryTextColor = colorScheme.onBackground;
    final Color secondaryTextColor = primaryTextColor.withOpacity(0.7);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            HomeTexts.emptyTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          InkWell(
            onTap: onQrPressed,
            child: Image.asset(
              'assets/output-onlinepngtools.png',
              height: 180,
              fit: BoxFit.contain,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                HomeTexts.scanHint1,
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 18,
                ),
              ),
              Text(
                HomeTexts.scanHint2,
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
