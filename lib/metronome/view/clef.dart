import 'package:flutter/material.dart';

class ClefWidget extends StatelessWidget {
  final Size canvasSize;
  const ClefWidget({
    super.key,
    required this.canvasSize,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: canvasSize,
      painter: ClefPainter()
    );
  }
}

class ClefPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
  
}