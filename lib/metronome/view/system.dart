import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_mate/utils/utils.dart';
import 'package:music_mate/metronome/metronome.dart';

class System extends StatelessWidget {
  final String clef;
  final String timeSignature;

  const System({
    super.key,
    required this.clef,
    required this.timeSignature,
  });

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
            //painter: StaffPainter(images: snapshot.data!, timeSignature: timeSignature),
          );
        }
      },
    );
  }
}

// class StaffPainter extends CustomPainter {
//   final String timeSignature;
//   final List<ui.Image> images;
//
//   StaffPainter({
//     required this.images,
//     required this.timeSignature,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2;
//
//     double startX = 0;
//     double endX = size.width;
//     double lineSpacing = 20;
//     for (int i = 0; i < 5; i++) {
//       canvas.drawLine(
//         Offset(startX, lineSpacing * (i + 1)),
//         Offset(endX, lineSpacing * (i + 1)),
//         paint,
//       );
//     }
//
//     // for (int i = 0; i < images.length; i++) {
//     //   if (i == 0) {
//     //     paintImage(
//     //       canvas: canvas,
//     //       rect: Rect.fromLTWH(-10, -10, 100, 150),
//     //       image: images[i],
//     //       fit: BoxFit.contain,
//     //     );
//     //   } else {
//     //     paintImage(
//     //       canvas: canvas,
//     //       rect: Rect.fromLTWH(
//     //         (i * 100),
//     //         0,
//     //         60,
//     //         100,
//     //       ),
//     //       image: images[i],
//     //       fit: BoxFit.contain,
//     //     );
//     //   }
//     // }
//
//     final timeSignatureText = TextPainter(
//       text: TextSpan(
//         text: timeSignature.replaceAll('/', '\n'),
//         style: TextStyle(fontSize: 40, color: Colors.black, fontFamily: 'Bravura'),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     timeSignatureText.layout();
//     timeSignatureText.paint(canvas, Offset(70, 10));
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }