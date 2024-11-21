import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_mate/utils/utils.dart';

class MusicSystem extends StatelessWidget {
  const MusicSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return const StaffWidget();
  }
}

class StaffWidget extends StatelessWidget {
  const StaffWidget({super.key});

  Future<ui.Image> _loadClefImage() async {
    final ByteData data = await rootBundle.load(CImages.trebleClef);
    final List<int> bytes = data.buffer.asUint8List();
    return decodeImageFromList(Uint8List.fromList(bytes));
  }

  Future<List<ui.Image>> _loadImages() async {
    final List<String> imagePaths = [
      CImages.trebleClef,
      CImages.quarterNote,
      CImages.quarterNote,
      CImages.quarterNote,
    ];

    return Future.wait(imagePaths.map((path) async {
      final ByteData data = await rootBundle.load(path);
      final List<int> bytes = data.buffer.asUint8List();
      return decodeImageFromList(Uint8List.fromList(bytes));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ui.Image>>(
      future: _loadImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load images'));
        } else {
          return CustomPaint(
            size: Size(400, 200),
            painter: StaffPainter(images: snapshot.data!),
          );
        }
      },
    );
  }
}

class StaffPainter extends CustomPainter {
  final List<ui.Image> images;

  StaffPainter({required this.images});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    double startX = 25;
    double endX = size.width;
    double lineSpacing = 20;
    for (int i = 0; i < 5; i++) {
      canvas.drawLine(
        Offset(startX, lineSpacing * (i + 1)),
        Offset(endX, lineSpacing * (i + 1)),
        paint,
      );
    }

    for (int i = 0; i < images.length; i++) {
      if (i == 0) {
        paintImage(
          canvas: canvas,
          rect: Rect.fromLTWH(0, 0, 100, 130),
          image: images[i],
          fit: BoxFit.contain,
        );
      } else {
        paintImage(
          canvas: canvas,
          rect: Rect.fromLTWH(
            10 + (i * 100),
            10,
            60,
            100,
          ),
          image: images[i],
          fit: BoxFit.contain,
        );
      }
    }

    final timeSignatureText = TextPainter(
      text: const TextSpan(
        text: '3\n4',
        style: TextStyle(fontSize: 40, color: Colors.black, fontFamily: 'Bravura'),
      ),
      textDirection: TextDirection.ltr,
    );
    timeSignatureText.layout();
    timeSignatureText.paint(canvas, Offset(80, 10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}