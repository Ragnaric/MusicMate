import 'package:flutter/material.dart';
import 'package:music_mate/utils/utils.dart';

class CDrawer extends StatelessWidget {
  const CDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: ScreenUtils.screenWidth(context) * .85,
      )
    );
  }
}
