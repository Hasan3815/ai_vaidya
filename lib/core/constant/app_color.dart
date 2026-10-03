import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff2F80ED);
  static const Color accent = Color(0xff56CCF2);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color background = Color(0xffF4F6F8);
  static const Color textPrimary = Color(0xff111827);
  static const Color textSecondary = Color(0xff6B7280);

  static LinearGradient primaryGradient = const LinearGradient(
    colors: [
      Color(0xff2F80ED),
      Color(0xff56CCF2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}