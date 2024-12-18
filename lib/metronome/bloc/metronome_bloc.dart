import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:music_mate/utils/utils.dart';

part 'metronome_event.dart';
part 'metronome_state.dart';

class MetronomeBloc extends Bloc<MetronomeEvent, MetronomeState> {
  MetronomeBloc() : super(const MetronomeInitial()) {
    on<TempoChanged>(_changeTempo);
    on<TimeSignatureChanged>(_changeTimeSignature);
  }

  void _changeTempo(TempoChanged event, Emitter<MetronomeState> emit) {
    emit(state.copyWith(tempo: event.tempo));
  }

  void _changeTimeSignature(TimeSignatureChanged event, Emitter<MetronomeState> emit) {
    emit(state.copyWith(timeSignature: event.timeSignature));
  }
}
