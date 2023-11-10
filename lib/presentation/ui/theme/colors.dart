import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF81C4FF);
  static const Color secondary = Color(0xFFE7222E);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF16588E)],
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, Color(0xFFA81923)],
  );

  static const Color black = Color(0xFF1D1617);
  static const Color white = Color(0xFFFFFFFF);

  static const Color grayHight = Color(0xFF7B6F72);
  static const Color grayMedium = Color(0xFFADA4A5);
  static const Color grayLight = Color(0xFFDDDADA);

  //TODO: rename
  static const Color borderLight = Color(0xFFF7F8F8);

  static const Color error = Colors.red;
}
