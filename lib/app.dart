import 'package:flutter/material.dart';
import 'package:music_mate/common/common.dart';

class MusicMate extends StatelessWidget {
  const MusicMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Mate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MusicMateView(),
    );
  }
}

class MusicMateView extends StatelessWidget {
  const MusicMateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CDrawer(),
      appBar: CAppBar(title: 'Music Mate'),
      body: Placeholder(),
    );
  }
}
