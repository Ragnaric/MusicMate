import 'package:flutter/material.dart';
import 'package:music_mate/utils/utils.dart';

import 'home/home.dart';

class MusicMate extends StatelessWidget {
  const MusicMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Mate',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
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
