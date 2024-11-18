import 'package:flutter/material.dart';
import 'package:music_mate/common/common.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CDrawer(),
      appBar: CAppBar(title: 'Music Mate'),
      body: Placeholder(),
    );
  }
}
