import 'package:carlist/presentation/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        secondary: AppColors.secondary,
        onSecondary: AppColors.white,
        error: AppColors.error,
        onError: AppColors.white,
        background: AppColors.white,
        onBackground: AppColors.black,
        surface: AppColors.primary.withOpacity(0.5),
        onSurface: AppColors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.primary),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 26,
          color: AppColors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
        displaySmall: TextStyle(
          fontSize: 22,
          color: AppColors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          color: AppColors.black,
          fontFamily: 'Poppins',
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        bodyLarge: TextStyle(
          fontSize: 12,
          color: AppColors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColors.black,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
