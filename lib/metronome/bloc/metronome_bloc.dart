import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'metronome_event.dart';
part 'metronome_state.dart';

class MetronomeBloc extends Bloc<MetronomeEvent, MetronomeState> {
  MetronomeBloc() : super(MetronomeInitial()) {
    on<MetronomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
