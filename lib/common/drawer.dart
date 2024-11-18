import 'package:flutter/material.dart';
import 'package:music_mate/utils/utils.dart';

class CDrawer extends StatelessWidget {
  const CDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: ScreenUtils.screenWidth(context) * .85,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: CSizes.defaultSpace),
              Text('Metronome'),
              SizedBox(height: CSizes.defaultSpace),
              Text('Tuner'),
              SizedBox(height: CSizes.defaultSpace),
              Text('Sheet Music'),
              SizedBox(height: CSizes.defaultSpace),
              Text('Preferences'),
              SizedBox(height: CSizes.defaultSpace),
              Text('Rate this app'),
              SizedBox(height: CSizes.defaultSpace),
              Text('Share this app'),
              SizedBox(height: CSizes.defaultSpace),
            ],
          ),
        ),
      )
    );
  }
}
