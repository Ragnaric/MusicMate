part of 'metronome_bloc.dart';

sealed class MetronomeEvent {
  const MetronomeEvent();
}

final class MetronomeStarted extends MetronomeEvent {}

final class MetronomeStopped extends MetronomeEvent {}

final class TempoChanged extends MetronomeEvent {
  final int tempo;

  const TempoChanged({required this.tempo});
}

final class TimeSignatureChanged extends MetronomeEvent {
  final String timeSignature;

  const TimeSignatureChanged({required this.timeSignature});
}

final class ClefChanged extends MetronomeEvent {
  final String clef;

  const ClefChanged({required this.clef});
}

final class NextBeat extends MetronomeEvent {}