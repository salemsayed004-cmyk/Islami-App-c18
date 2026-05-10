import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class ThemeManager {
  static ThemeData lightTheme() => ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.gold,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gold,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.white,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontFamily: "Janna",
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontFamily: "Janna",
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Janna",
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Janna",
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
