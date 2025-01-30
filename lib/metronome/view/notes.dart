import 'package:flutter/material.dart';
import 'package:music_mate/utils/constants/constants.dart';

class NotesWidget extends StatelessWidget {
  final int number;
  final int type;
  final int beat;
  const NotesWidget({
    super.key,
    required this.number,
    required this.type,
    required this.beat,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 120,
      child: Row(
        children: List<Widget>.generate(
          number,
          (i) => Opacity(
            opacity: i + 1 == beat ? 1 : 0,
            child: Image.asset(
              CImages.quarterNote,
              height: 70,
            ),
          )
        ),
      )
    );
  }
}
