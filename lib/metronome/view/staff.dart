import 'package:flutter/material.dart';

class StaffWidget extends StatelessWidget {
  final Size canvasSize;
  const StaffWidget({
    super.key,
    required this.canvasSize,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: canvasSize,
      painter: StaffPainter(),
    );
  }
}

class StaffPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    double startX = 0;
    double endX = size.width;
    double lineSpacing = 20;

    for (int i = 0; i < 5; i++) {
      canvas.drawLine(
        Offset(startX, lineSpacing * (i + 1)),
        Offset(endX, lineSpacing * (i + 1)),
        paint
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}