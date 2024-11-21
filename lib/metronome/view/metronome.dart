import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../metronome.dart';

class MetronomePage extends StatelessWidget {
  const MetronomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MetronomePage());
  }

  @override
  Widget build(BuildContext context) {
    final metronomeState = context.read<MetronomeBloc>().state as MetronomeInitial;

    return Center(
      child: Column(
        children: [
          StaffWidget(clef: metronomeState.clef, timeSignature: metronomeState.timeSignature),
          ElevatedButton(
              onPressed: () {}, child: Text('Current tempo: ${metronomeState.tempo}')
          ),
          ElevatedButton(
              onPressed: () {}, child: Text('Next beat')
          ),
          ElevatedButton(
              onPressed: () {}, child: Text('Change time signature')
          ),
        ],
      ),
    );
  }
}
