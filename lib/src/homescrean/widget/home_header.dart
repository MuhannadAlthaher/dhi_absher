import 'package:dhi_absher/src/homescrean/constant/constant.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const HomeHeader({
    super.key,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDark
          ?  HomeColors.background
          : Colors.white, 
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.menu, color: isDark ? Colors.white : Colors.black87, size: 30),
        onPressed: onMenuPressed,
      ),
    );
  }
}
