import 'package:dhi_absher/src/homescrean/constant/constant.dart';
import 'package:flutter/material.dart';

class HomeBottomQrButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HomeBottomQrButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      color: isDark ? HomeColors.background : Colors.white,
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: HomeColors.button,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            HomeTexts.bottomButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
