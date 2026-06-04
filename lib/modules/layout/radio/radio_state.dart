// ============================================================
// radio_state.dart
// Place: lib/modules/layout/radio/radio_state.dart
// ============================================================

import 'package:equatable/equatable.dart';
import 'package:islami/modules/layout/radio/radio_station_model.dart';
import 'package:islami/modules/layout/radio/reciter_model.dart';

enum RadioTab { radio, reciters }

abstract class RadioState extends Equatable {
  const RadioState();

  @override
  List<Object?> get props => [];
}

class RadioInitial extends RadioState {
  const RadioInitial();
}

class RadioLoading extends RadioState {
  const RadioLoading();
}

class RadioError extends RadioState {
  const RadioError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class RadioLoaded extends RadioState {
  const RadioLoaded({
    required this.stations,
    required this.reciters,
    required this.activeTab,
    this.playingId,
    this.isMuted = false,
    this.isBuffering = false,
  });

  final List<RadioStationModel> stations;
  final List<ReciterModel> reciters;
  final RadioTab activeTab;

  /// Namespaced: "radio_<id>" or "reciter_<id>". Null when nothing plays.
  final String? playingId;
  final bool isMuted;
  final bool isBuffering;

  bool isPlayingStation(RadioStationModel s) => playingId == 'radio_${s.id}';
  bool isPlayingReciter(ReciterModel r)       => playingId == 'reciter_${r.id}';
  bool get isAnythingPlaying                  => playingId != null;

  RadioLoaded copyWith({
    List<RadioStationModel>? stations,
    List<ReciterModel>? reciters,
    RadioTab? activeTab,
    String? playingId,
    bool clearPlayingId = false,
    bool? isMuted,
    bool? isBuffering,
  }) {
    return RadioLoaded(
      stations: stations ?? this.stations,
      reciters: reciters ?? this.reciters,
      activeTab: activeTab ?? this.activeTab,
      playingId: clearPlayingId ? null : (playingId ?? this.playingId),
      isMuted: isMuted ?? this.isMuted,
      isBuffering: isBuffering ?? this.isBuffering,
    );
  }

  @override
  List<Object?> get props =>
      [stations, reciters, activeTab, playingId, isMuted, isBuffering];
}