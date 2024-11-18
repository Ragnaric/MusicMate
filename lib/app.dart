import 'package:flutter/material.dart';

import 'home/home.dart';

class MusicMate extends StatelessWidget {
  const MusicMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Mate',
      theme: ThemeData(
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
    return const HomePage();
  }
}
