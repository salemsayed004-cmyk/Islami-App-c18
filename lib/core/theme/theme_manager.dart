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
  );
}
