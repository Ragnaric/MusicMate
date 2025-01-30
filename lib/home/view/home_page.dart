import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_mate/common/common.dart';
import 'package:music_mate/metronome/metronome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MetronomeBloc(),
      child: Scaffold(
        drawer: CDrawer(),
        appBar: CAppBar(title: 'Music Mate'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MetronomePage(),
          ],
        ),
      ),
    );
  }
}
