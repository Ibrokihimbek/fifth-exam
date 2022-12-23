import 'package:fifth_exam/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.white;

    Path paths = Path();

    paths.lineTo(0, size.height * 0.5);

    paths.cubicTo(
      size.width * 0.3,
      size.height * 0.2,
      size.width * 0.5,
      size.height * 0.7,
      size.width,
      size.height * 0.5,
    );

    paths.lineTo(size.width, 0);
    canvas.drawPath(paths, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
