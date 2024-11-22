part of 'metronome_bloc.dart';

/// Custom exception for metronome-related validation errors
class MetronomeException implements Exception {
  final String message;
  MetronomeException(this.message);

  @override
  String toString() => 'MetronomeException: $message';
}

sealed class MetronomeState extends Equatable {
  final int tempo;
  final String clef;
  final String timeSignature;

  const MetronomeState({
    required this.tempo,
    required this.clef,
    required this.timeSignature,
  });

  MetronomeState copyWith({
    int? tempo,
    String? clef,
    String? timeSignature,
  }) {
    return switch (this) {
      MetronomeInitial() => MetronomeInitial(
        tempo: tempo ?? this.tempo,
        timeSignature: timeSignature ?? this.timeSignature,
        clef: clef ?? this.clef,
      ),
      _ => MetronomeInitial(
        tempo: tempo ?? this.tempo,
        timeSignature: timeSignature ?? this.timeSignature,
        clef: clef ?? this.clef,
      )
    };
  }

  void validate () {
    if (tempo < 30 || tempo > 200) {
      throw MetronomeException('Tempo must be between 30 and 200 BPM');
    }

    if (!RegExp(r'^\d+/\d+$').hasMatch(timeSignature)) {
      throw MetronomeException('Time signature must be written as a fraction: "n/n"');
    }

    if (!['treble', 'bass', 'alto'].contains(clef)) {
      throw MetronomeException('Invalid clef');
    }
  }

  @override
  List<Object> get props => [tempo, timeSignature, clef];
}

final class MetronomeInitial extends MetronomeState {
  const MetronomeInitial({
    super.tempo = 120,
    super.timeSignature = '4/4',
    super.clef = 'treble',
  });
}

final class MetronomePlaying extends MetronomeState {
  // this state will have the total number of notes be equal to the numerator of
  // of the time signature and the type of note equal to the denominator
  final List<dynamic>? notes;

  const MetronomePlaying({
    required super.tempo,
    required super.clef,
    required super.timeSignature,
    this.notes,
  });

  @override
  List<Object> get props => [...super.props];
}

final class MetronomePaused extends MetronomeState {
  // this state will also have the remaining time for the current beat
  const MetronomePaused({
    required super.tempo,
    required super.clef,
    required super.timeSignature,
  });
}

final class MetronomeError extends MetronomeState {
  final String errorMessage;

  const MetronomeError({
    required super.tempo,
    required super.timeSignature,
    required super.clef,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [...super.props, errorMessage];
}