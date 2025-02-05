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
    on<TempoChanged>(_changeTempo);
    on<TimeSignatureChanged>(_changeTimeSignature);
    on<ClefChanged>(_changeClef);
    on<NextBeat>(_goToNextBeat);
    on<MetronomeStarted>(_startMetronome);
    on<MetronomeStopped>(_stopMetronome);
  }

  void _changeTempo(TempoChanged event, Emitter<MetronomeState> emit) {
    emit(state.copyWith(tempo: event.tempo));
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
    final interval = Duration(milliseconds: (60000 / state.tempo).round());
    _timer = Timer.periodic(interval, (_) {
      _playSound();
      add(NextBeat());
    });
  }

  void _restartTimer(Emitter<MetronomeState> emit) {
    _timer?.cancel();
    _startTimer(emit);
  }

  Future<void> _playSound() async {
    // the addition of a tenth of the playback rate is to account for the extra duration of the audio file
    // since it is not exactly 1 second
    final playbackRate = state.tempo / 60;
    _audioPlayer.setPlaybackRate(playbackRate + playbackRate * .1);
    await _audioPlayer.play(AssetSource(CSounds.tick));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
