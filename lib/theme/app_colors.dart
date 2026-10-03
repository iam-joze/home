import 'package:flutter/material.dart';

class AppColors {
  static const primaryBlue = Color(0xFF3D5AFE);
  static const deepNavy = Color(0xFF0A1A3D);

  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryBlue, deepNavy],
  );

  static const cardBackground = Colors.white;
  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF757575);
  static const screenBackground = Color(0xFFEFF3FA);

}