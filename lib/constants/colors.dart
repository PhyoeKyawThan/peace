import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color primaryLight = Color(0xFFFFC107); // Gold
  static const Color secondaryLight = Color(0xFFFF9800); // Saffron
  static const Color backgroundLight = Color(0xFFFFF8E1); // Cream
  static const Color accentLight = Color(0xFF795548); // Soft Brown
  static const Color textPrimaryLight = Color(0xFF212121); // Dark Grey
  static const Color textSecondaryLight = Color(0xFF616161); // Medium Grey
  static const Color highlightLight = Color(0xFFFFEB3B); // Soft Yellow

  // Dark Theme Colors
  static const Color primaryDark = Color(0xFFFFB300); // Dark Gold
  static const Color secondaryDark = Color(0xFFFF6F00); // Dark Saffron
  static const Color backgroundDark = Color(0xFF303030); // Dark Grey
  static const Color accentDark = Color(0xFF5D4037); // Deep Brown
  static const Color textPrimaryDark = Color(0xFFE0E0E0); // Light Grey
  static const Color textSecondaryDark = Color(0xFFBDBDBD); // Medium Light Grey
  static const Color highlightDark = Color(0xFFFFD54F); // Soft Yellow
}

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.textPrimaryLight,
      elevation: 2,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentLight,
      foregroundColor: AppColors.textPrimaryLight,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColors.textPrimaryLight),
      bodyMedium: TextStyle(color: AppColors.textSecondaryLight),
      headlineLarge: TextStyle(color: AppColors.textPrimaryLight),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryLight,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 2,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentDark,
      foregroundColor: AppColors.textPrimaryDark,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColors.textPrimaryDark),
      bodyMedium: TextStyle(color: AppColors.textSecondaryDark),
      headlineLarge: TextStyle(color: AppColors.textPrimaryDark),
    ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(secondary: AppColors.secondaryDark),
  );
}
