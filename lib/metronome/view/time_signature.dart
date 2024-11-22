import 'package:flutter/material.dart';

class TimeSignature extends StatelessWidget {
  final Size canvasSize;
  final String timeSignature;
  const TimeSignature({
    super.key,
    required this.canvasSize,
    required this.timeSignature,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: canvasSize,
      painter: SignaturePainter(timeSignature: timeSignature),
    );
  }
}

class SignaturePainter extends CustomPainter {
  final String timeSignature;

  SignaturePainter({required this.timeSignature});
  
  @override
  void paint(Canvas canvas, Size size) {
    final timeSignatureText = TextPainter(
      text: TextSpan(
        text: timeSignature.replaceAll('/', '\n'),
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