import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_mate/metronome/view/clef.dart';
import 'package:music_mate/utils/utils.dart';

import '../metronome.dart';

class MetronomePage extends StatelessWidget {
  const MetronomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MetronomePage());
  }

  @override
  Widget build(BuildContext context) {
    final Size canvas = Size(
      ScreenUtils.screenWidth(context) - 20,
      200
    );

    return BlocBuilder<MetronomeBloc, MetronomeState>(
      builder: (context, state) {
        final bloc = context.read<MetronomeBloc>();
        final numerator = int.parse(state.timeSignature.split('/')[0]);
        final denominator = int.parse(state.timeSignature.split('/')[1]);

        return Center(
          child: Column(
            children: [
              Stack(
                children: [
                  StaffWidget(canvasSize: canvas),
                  TimeSignature(
                    canvasSize: canvas,
                    timeSignature: state.timeSignature,
                  ),
                  ClefWidget(
                    clef: state.clef,
                  ),
                  NotesWidget(
                    number: numerator,
                    type: denominator,
                    beat: state.beat,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    final tempo = state.tempo == 120 ? 60 : 120;
                    bloc.add(TempoChanged(tempo: tempo));
                  },
                  child: Text('Current tempo: ${state.tempo}')
              ),

              ElevatedButton(
                  onPressed: () {
                    final clef = state.clef == 'treble' ? 'bass' : 'treble';
                    bloc.add(ClefChanged(clef: clef));
                  },
                  child: Text('Change clef'),
              ),
              ElevatedButton(
                  onPressed: () {
                    final signature = state.timeSignature == '4/4' ? '3/4' : '4/4';
                    bloc.add(TimeSignatureChanged(timeSignature: signature));
                  },
                  child: Text('Change time signature'),
              ),
              ElevatedButton(
                  onPressed: () {
                    bloc.add(NextBeat());
                  },
                  child: Text('${state.beat}'),
              ),
              ElevatedButton(
                onPressed: () => bloc.add(MetronomeStarted()),
                child: Text('Play'),
              ),
              ElevatedButton(
                onPressed: () => bloc.add(MetronomeStopped()),
                child: Text('Stop'),
              ),
            ],
          ),
        );
      },
    );
  }
}
