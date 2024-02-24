import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligtTheme = ThemeData(
      useMaterial3: true,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.white,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.grey2,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ));
}
