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
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 8,
        shadowColor: Colors.black26,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.primary),
      ),
    );
  }
}
