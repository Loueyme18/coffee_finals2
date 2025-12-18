import 'package:flutter/material.dart';

class AppColors {
  // 🌞 Light Mode Palette
  static const Color blueberryLight = Color(0xFF2C3F70);
  static const Color strawberryLight = Color(0xFFA5231C);
  static const Color buttercreamLight = Color(0xFFCBD4E5);
  static const Color violetLight = Color(0xFF8089D2);
  static const Color meringueLight = Color(0xFFE8EBED);

  // 🌙 Dark Mode Palette
  static const Color blueberryDark = Color(0xFF1D202A);
  static const Color strawberryDark = Color(0xFF4F2023);
  static const Color buttercreamDark = Color(0xFF605C63);
  static const Color violetDark = Color(0xFF383448);
  static const Color meringueDark = Color(0xFFD7D0C4);
}

class AppTheme {
  // 🌞 Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.meringueLight,
    primaryColor: AppColors.strawberryLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.strawberryLight,
      secondary: AppColors.violetLight,
      surface: AppColors.buttercreamLight,
      onPrimary: AppColors.blueberryLight,
      onSecondary: AppColors.blueberryLight,
      onSurface: AppColors.blueberryLight,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Fraunces',
        color: AppColors.blueberryLight,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'MerriweatherSans',
        color: AppColors.blueberryLight,
      ),
    ),
  );

  // 🌙 Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blueberryDark,
    primaryColor: AppColors.strawberryDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.strawberryDark,
      secondary: AppColors.violetDark,
      surface: AppColors.buttercreamDark,
      onPrimary: AppColors.meringueDark,
      onSecondary: AppColors.meringueDark,
      onSurface: AppColors.meringueDark,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Fraunces',
        color: AppColors.meringueDark,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'MerriweatherSans',
        color: AppColors.meringueDark,
      ),
    ),
  );
}
