import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xff025035);
  static const Color secondaryGreen = Color(0xff156B40);

  static const Color darkBackground = Color(0xff1A1A1A);
  static const Color lightBackground = Colors.white;

  static const Color cardOverlay = Color(0x40FFFFFF);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      brightness: Brightness.light,
    ),
    fontFamily: 'Roboto',
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Roboto',
  );
}
