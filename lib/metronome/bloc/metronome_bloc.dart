import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:music_mate/utils/utils.dart';
import 'package:audioplayers/audioplayers.dart';

part 'metronome_event.dart';
part 'metronome_state.dart';

class MetronomeBloc extends Bloc<MetronomeEvent, MetronomeState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _timer;

  MetronomeBloc() : super(const MetronomeInitial()) {
    _audioPlayer
      ..setReleaseMode(ReleaseMode.stop)
      ..setSource(AssetSource(CSounds.sound))
      ..audioCache;
    on<TempoChanged>(_changeTempo);
    on<TimeSignatureChanged>(_changeTimeSignature);
    on<ClefChanged>(_changeClef);
    on<NextBeat>(_goToNextBeat);
    on<MetronomeStarted>(_startMetronome);
    on<MetronomeStopped>(_stopMetronome);
  }

  void _changeTempo(TempoChanged event, Emitter<MetronomeState> emit) {
    emit(state.copyWith(tempo: event.tempo));
    if (state is MetronomePlaying) {
      _restartTimer(emit);
    }
  }

  void _changeTimeSignature(TimeSignatureChanged event, Emitter<MetronomeState> emit) {
    emit(state.copyWith(
      timeSignature: event.timeSignature,
      beat: 1
    ));
  }

  void _changeClef(ClefChanged event, Emitter<MetronomeState> emit) {
    emit(state.copyWith(clef: event.clef));
  }

  void _goToNextBeat(NextBeat event, Emitter<MetronomeState> emit) {
    final numerator = int.parse(state.timeSignature.split('/')[0]);
    final nextBeat = (state.beat % numerator) + 1;
    emit(state.copyWith(beat: nextBeat));
    _playSound();
  }

  void _startMetronome(MetronomeStarted event, Emitter<MetronomeState> emit) {
    if (state is! MetronomePlaying) {
      emit(MetronomePlaying(
        tempo: state.tempo,
        clef: state.clef,
        timeSignature: state.timeSignature,
        beat: 1,
      ));
      _startTimer(emit);
    }
  }
  
  void _stopMetronome(MetronomeStopped event, Emitter<MetronomeState> emit) {
    _timer?.cancel();
    emit(MetronomePaused(
      tempo: state.tempo,
      clef: state.clef,
      timeSignature: state.timeSignature,
      beat: state.beat,
    ));
  }

  void _startTimer(Emitter<MetronomeState> emit) {
    _timer?.cancel();
    _playSound();
    final interval = Duration(milliseconds: 60000 ~/ state.tempo);
    _timer = Timer.periodic(interval, (_) {
      add(NextBeat());
    });
  }

  void _restartTimer(Emitter<MetronomeState> emit) {
    _timer?.cancel();
    _startTimer(emit);
  }

  Future<void> _playSound() async {
    final playbackRate = state.tempo / 60;
    _audioPlayer.setPlaybackRate(playbackRate);
    _audioPlayer.resume();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
