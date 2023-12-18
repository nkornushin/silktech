import 'package:flutter/material.dart';
import 'package:silktech_users/config/themes/colors.dart';

import 'styles.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    splashColor: Colors.transparent,
    useMaterial3: true,
    canvasColor: AppColors.white,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      color: AppColors.lightPrimary,
      elevation: 1,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        color: AppColors.gray,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        color: AppColors.darkPrimary,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.lightSeedColor,
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightTertiary,
      background: AppColors.lightBackground,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFFFFFFFF),
        disabledForegroundColor: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppStyles.btnRadius,
          ),
        ),
        backgroundColor: AppColors.lightPrimary,
        disabledBackgroundColor: AppColors.lightPrimary.withOpacity(.4),
        elevation: 0,
        textStyle: AppStyles.elevatedButtonTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          fontFamily: 'Roboto',
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: .1,
          color: Color(0xFF007AFF),
        ),
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.lightSeedColor,
      surfaceTintColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      size: AppStyles.mediumIconSize,
      color: AppColors.darkSecondary,
    ),
  );
}
