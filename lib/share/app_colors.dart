import 'package:flutter/material.dart';

class AppColors {
  static Gradient primaryColor = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF16C290),
      Color(0xFF5EBEAC),
    ],
  );
  static Gradient secondColorGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xFFF0F0F0),
      Color(0xFFF0F0F0),
    ],
  );
  static Gradient whiteGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.topLeft,
    colors: [
      Colors.white,
      Colors.white,
    ],
  );
  static Color secondColor = const Color(0xFFF0F0F0);
  static Color lightGreen = const Color(0xFF00C19C);
  static Color blackText = const Color(0xFF3C3C3C);
  static Color whiteText = Colors.white;
  static Color red = Colors.red;
  static Color hintText = const Color(0xFF787878);
}
