part of 'metronome_bloc.dart';

sealed class MetronomeState extends Equatable {
  const MetronomeState();
}

final class MetronomeInitial extends MetronomeState {
  // this state will have just the staff, clef, and time signature without any notes

  @override
  List<Object> get props => [];
}

final class MetronomePlaying extends MetronomeState {
  // this state will have the total number of notes be equal to the numerator of
  // of the time signature and a timer to keep track of the current beat

  @override
  List<Object> get props => [];
}

final class MetronomePaused extends MetronomeState {
  // this state will also have the remaining time for the current beat

  @override
  List<Object> get props => [];
}