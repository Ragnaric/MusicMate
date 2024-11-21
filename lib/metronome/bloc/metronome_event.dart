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