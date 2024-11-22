import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_mate/utils/constants/constants.dart';

class ClefWidget extends StatelessWidget {
  final Size canvasSize;
  const ClefWidget({
    super.key,
    required this.canvasSize,
  });

  Future<ui.Image> loadImage(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadImage(CImages.bassClef),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load images'));
        } else {
          return CustomPaint(
            size: canvasSize,
            painter: ClefPainter(image: snapshot.data!),
          );
        }
      },
    );
  }
}

class ClefPainter extends CustomPainter {
  final ui.Image image;

  ClefPainter({
    required this.image
  });

  @override
  void paint(Canvas canvas, Size size) {
    paintImage(
      canvas: canvas, 
      rect: const Rect.fromLTWH(-10, -15, 100, 150),
      image: image,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}