import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligtTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shadowColor: AppColors.white,
      elevation: 0,
    ),
  );
}
