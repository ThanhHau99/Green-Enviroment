import 'dart:math';

import 'package:envapp/share/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  final strokeCircle = 15.0;
  double currentProgress;
  CircleProgress(this.currentProgress);
  @override
  void paint(Canvas canvas, Size size) {
    // draw circle
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = AppColors.secondColor
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 150;
    canvas.drawCircle(center, radius, circle);

    // draw animation
    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = AppColors.lightGreen
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 2,
      angle,
      false,
      animationArc,
    );

    // background
    Paint backgroundStroke = Paint()
      ..strokeWidth = 2
      ..color = AppColors.lightGreen
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, 100, backgroundStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
