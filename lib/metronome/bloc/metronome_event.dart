part of 'metronome_bloc.dart';

sealed class MetronomeEvent {
  const MetronomeEvent();
}

final class MetronomeStopped extends MetronomeEvent {
  const MetronomeStopped();
}

final class MetronomeResumed extends MetronomeEvent {
  const MetronomeResumed();
}

final class MetronomeRestarted extends MetronomeEvent {
  const MetronomeRestarted();
}

final class TempoChanged extends MetronomeEvent {
  final int tempo;

  const TempoChanged({required this.tempo});
}

final class TimeSignatureChanged extends MetronomeEvent {
  final String timeSignature;

  const TimeSignatureChanged({required this.timeSignature});
}