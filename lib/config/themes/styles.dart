import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static double btnRadius = 16;

  static double mediumRadius = 32;

  static EdgeInsets smallPadding = const EdgeInsets.all(8);

  static const TextStyle elevatedButtonTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static double smallIconSize = 16;
  static double mediumIconSize = 32;
  static double largeIconSize = 64;
  static double xlargeIconSize = 80;
  static double x2largeIconSize = 160;

  static TextStyle headline = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    height: 24 / 17,
    color: AppColors.black,
    letterSpacing: .15,
  );

  static TextStyle caption2 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 14 / 11,
    color: AppColors.gray,
    letterSpacing: .4,
  );

  static TextStyle caption1 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.darkGray,
    letterSpacing: .2,
  );

  static TextStyle footnote = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    height: 18 / 13,
    color: AppColors.gray,
    letterSpacing: .1,
    fontFamily: 'Roboto',
  );

  static TextStyle footnoteBold = footnote.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle body = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    height: 24 / 17,
    color: AppColors.darkGray,
  );

  static TextStyle subhead = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 20 / 15,
    color: AppColors.superLight,
    letterSpacing: -.1,
  );
}
