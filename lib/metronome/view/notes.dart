import 'package:flutter/material.dart';
import 'package:music_mate/utils/constants/constants.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 100,
      child: Row(
        children: [
          Image.asset(CImages.quarterNote, height: 70,),
          Image.asset(CImages.quarterNote, height: 70,),
          Image.asset(CImages.quarterNote, height: 70,),
          Image.asset(CImages.quarterNote, height: 70,),
        ],
      ),
    );
  }
}
