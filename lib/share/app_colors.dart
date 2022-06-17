import 'package:flutter/material.dart';

class AppColors {
  static Gradient primaryColor = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xFF7E78EE),
      Color(0xFFA994E6),
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
  static Color secondColor = const Color(0xFFF0F0F0);
  static Color lightPurple = const Color(0xFFA994E6);
  static Color purple = const Color(0xFF7E78EE);
}
