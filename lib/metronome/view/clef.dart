import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_mate/utils/constants/constants.dart';

class ClefWidget extends StatelessWidget {
  final String clef;
  const ClefWidget({
    super.key,
    required this.clef,
  });

  @override
  Widget build(BuildContext context){
    return Image.asset(
      clef == 'treble' ? CImages.trebleClef : CImages.bassClef,
      height: clef == 'treble' ? 130 : 100,
      width: clef == 'treble' ? 80 : 60,
    );
  }
}