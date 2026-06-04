// ============================================================
// radio_cubit.dart
// Place: lib/modules/layout/radio/radio_cubit.dart
// ============================================================

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:islami/modules/layout/radio/radio_remote_data_source.dart';
import 'package:islami/modules/layout/radio/radio_repository.dart';
import 'package:islami/modules/layout/radio/radio_station_model.dart';
import 'package:islami/modules/layout/radio/reciter_model.dart';
import 'package:islami/modules/layout/radio/radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit({required RadioRepository repository})
      : _repository = repository,
        super(const RadioInitial());

  final RadioRepository _repository;
  final AudioPlayer _player = AudioPlayer();

  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<ProcessingState>? _processingSub;

  // ── Init ────────────────────────────────────────────────────────────────

  Future<void> init() async {
    emit(const RadioLoading());
    try {
      final results = await Future.wait([
        _repository.getRadioStations(),
        _repository.getReciters(),
      ]);
      emit(RadioLoaded(
        stations: results[0] as List<RadioStationModel>,
        reciters: results[1] as List<ReciterModel>,
        activeTab: RadioTab.radio,
      ));
      _subscribeToPlayer();
    } on RadioApiException catch (e) {
      emit(RadioError(message: e.message));
    } catch (_) {
      emit(const RadioError(message: 'Something went wrong. Please try again.'));
    }
  }

  // ── Tab ─────────────────────────────────────────────────────────────────

  void switchTab(RadioTab tab) {
    final s = _loaded;
    if (s == null || s.activeTab == tab) return;
    emit(s.copyWith(activeTab: tab));
  }

  // ── Playback ─────────────────────────────────────────────────────────────

  Future<void> toggleRadioStation(RadioStationModel station) async {
    final s = _loaded;
    if (s == null) return;
    final id = 'radio_${station.id}';
    if (s.playingId == id) {
      await _player.pause();
      emit(s.copyWith(clearPlayingId: true, isBuffering: false));
      return;
    }
    await _stopPlayer();
    emit(s.copyWith(playingId: id, isBuffering: true));
    await _startStream(station.streamUrl);
  }

  Future<void> toggleReciter(ReciterModel reciter) async {
    final s = _loaded;
    if (s == null) return;
    final id  = 'reciter_${reciter.id}';
    final url = reciter.defaultStreamUrl;
    if (url == null) return;
    if (s.playingId == id) {
      await _player.pause();
      emit(s.copyWith(clearPlayingId: true, isBuffering: false));
      return;
    }
    await _stopPlayer();
    emit(s.copyWith(playingId: id, isBuffering: true));
    await _startStream(url);
  }

  Future<void> toggleMute() async {
    final s = _loaded;
    if (s == null) return;
    final newMuted = !s.isMuted;
    await _player.setVolume(newMuted ? 0.0 : 1.0);
    emit(s.copyWith(isMuted: newMuted));
  }

  Future<void> refresh() async {
    await _stopPlayer();
    emit(const RadioLoading());
    try {
      final results = await Future.wait([
        _repository.getRadioStations(forceRefresh: true),
        _repository.getReciters(forceRefresh: true),
      ]);
      emit(RadioLoaded(
        stations: results[0] as List<RadioStationModel>,
        reciters: results[1] as List<ReciterModel>,
        activeTab: RadioTab.radio,
      ));
      _subscribeToPlayer();
    } on RadioApiException catch (e) {
      emit(RadioError(message: e.message));
    } catch (_) {
      emit(const RadioError(message: 'Refresh failed. Please try again.'));
    }
  }

  // ── Audio helpers ─────────────────────────────────────────────────────────

  Future<void> _startStream(String url) async {
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(url)));
      await _player.play();
    } catch (_) {
      final s = _loaded;
      if (s != null) emit(s.copyWith(clearPlayingId: true, isBuffering: false));
    }
  }

  Future<void> _stopPlayer() async => _player.stop();

  void _subscribeToPlayer() {
    _playerStateSub?.cancel();
    _processingSub?.cancel();

    _processingSub = _player.processingStateStream.listen((ps) {
      final s = _loaded;
      if (s == null) return;
      final buffering =
          ps == ProcessingState.loading || ps == ProcessingState.buffering;
      if (s.isBuffering != buffering) emit(s.copyWith(isBuffering: buffering));
    });

    _playerStateSub = _player.playerStateStream.listen((ps) {
      if (ps.processingState == ProcessingState.completed) {
        final s = _loaded;
        if (s != null) emit(s.copyWith(clearPlayingId: true, isBuffering: false));
      }
    });
  }

  RadioLoaded? get _loaded => state is RadioLoaded ? state as RadioLoaded : null;

  @override
  Future<void> close() async {
    await _playerStateSub?.cancel();
    await _processingSub?.cancel();
    await _player.dispose();
    return super.close();
  }
}