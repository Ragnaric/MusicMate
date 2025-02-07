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
  final int beat;

  const MetronomeState({
    required this.tempo,
    required this.clef,
    required this.timeSignature,
    required this.beat,
  });

  MetronomeState copyWith({
    int? tempo,
    String? clef,
    String? timeSignature,
    int? beat,
  }) {
    return switch (this) {
      MetronomeInitial() => MetronomeInitial(
        tempo: tempo ?? this.tempo,
        timeSignature: timeSignature ?? this.timeSignature,
        clef: clef ?? this.clef,
        beat: beat ?? this.beat,
      ),
      MetronomePlaying() => MetronomePlaying(
        tempo: tempo ?? this.tempo,
        timeSignature: timeSignature ?? this.timeSignature,
        clef: clef ?? this.clef,
        beat: beat ?? this.beat,
      ),
      MetronomePaused() => MetronomePaused(
        tempo: tempo ?? this.tempo,
        timeSignature: timeSignature ?? this.timeSignature,
        clef: clef ?? this.clef,
        beat: beat ?? this.beat,
      ),
      MetronomeError() => MetronomeError(
        tempo: tempo ?? this.tempo,
        timeSignature: timeSignature ?? this.timeSignature,
        clef: clef ?? this.clef,
        beat: beat ?? this.beat,
        errorMessage: (this as MetronomeError).errorMessage,
      ),
      //The following case is for any states that are not covered in the previous cases
      _ => MetronomeInitial(
        tempo: tempo ?? this.tempo,
        timeSignature: timeSignature ?? this.timeSignature,
        clef: clef ?? this.clef,
        beat: beat ?? this.beat,
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
  List<Object> get props => [tempo, timeSignature, clef, beat];
}

final class MetronomeInitial extends MetronomeState {
  const MetronomeInitial({
    super.tempo = 120,
    super.timeSignature = '4/4',
    super.clef = 'treble',
    super.beat = 0,
  });
}

final class MetronomePlaying extends MetronomeState {
  // this state will have the total number of notes be equal to the numerator of
  // of the time signature and the type of note equal to the denominator
  const MetronomePlaying({
    required super.tempo,
    required super.clef,
    required super.timeSignature,
    required super.beat,
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
    required super.beat,
  });
}

final class MetronomeError extends MetronomeState {
  final String errorMessage;

  const MetronomeError({
    required super.tempo,
    required super.timeSignature,
    required super.clef,
    required super.beat,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [...super.props, errorMessage];
}