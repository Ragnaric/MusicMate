import 'package:flutter/material.dart';

class TimeSignature extends StatelessWidget {
  final Size canvasSize;
  const TimeSignature({
    super.key,
    required this.canvasSize,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: canvasSize,
      painter: SignaturePainter(),
    );
  }
}

class SignaturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final timeSignatureText = TextPainter(
      text: TextSpan(
        text: '3\n4',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontFamily: 'Bravura',
          fontWeight: FontWeight.bold
        )
      ),
      textDirection: TextDirection.ltr
    );
    timeSignatureText.layout();
    timeSignatureText.paint(canvas, Offset(70, 10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}