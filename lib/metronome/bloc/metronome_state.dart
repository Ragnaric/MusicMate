part of 'metronome_bloc.dart';

sealed class MetronomeState extends Equatable {
  final int tempo;
  const MetronomeState(this.tempo);

  @override
  List<Object> get props => [tempo];
}

final class MetronomeInitial extends MetronomeState {
  // this state will have just the staff, clef, and time signature without any notes
  final String timeSignature;
  final String clef;

  const MetronomeInitial({
    this.timeSignature = '3/4', // time signatures must be written as a fraction
    this.clef = 'treble',
    int tempo = 60,
  }) : super(tempo);

  @override
  List<Object> get props => [timeSignature, clef, tempo];
}

final class MetronomePlaying extends MetronomeState {
  // this state will have the total number of notes be equal to the numerator of
  // of the time signature and the type of note equal to the denominator
  final List<dynamic> notes;

  const MetronomePlaying(
    this.notes,
    super.tempo,
  );

  @override
  List<Object> get props => [];
}

final class MetronomePaused extends MetronomeState {
  // this state will also have the remaining time for the current beat
  const MetronomePaused(super.tempo);

  @override
  List<Object> get props => [];
}