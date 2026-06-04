// ============================================================
// radio_repository.dart
// Place: lib/modules/layout/radio/radio_repository.dart
// ============================================================

import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islami/modules/layout/radio/radio_remote_data_source.dart';
import 'package:islami/modules/layout/radio/radio_station_model.dart';
import 'package:islami/modules/layout/radio/reciter_model.dart';

const String _kRadioBox     = 'radio_cache';
const String _kRadioKey     = 'stations';
const String _kRecitersKey  = 'reciters';

abstract class RadioRepository {
  Future<List<RadioStationModel>> getRadioStations({bool forceRefresh = false});
  Future<List<ReciterModel>> getReciters({bool forceRefresh = false});
}

class RadioRepositoryImpl implements RadioRepository {
  RadioRepositoryImpl({required RadioRemoteDataSource remoteDataSource})
      : _remote = remoteDataSource;

  final RadioRemoteDataSource _remote;

  @override
  Future<List<RadioStationModel>> getRadioStations({
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh) {
      final cached = await _load<RadioStationModel>(
        key: _kRadioKey,
        fromJson: RadioStationModel.fromJson,
      );
      if (cached != null) return cached;
    }
    final data = await _remote.getRadioStations();
    await _save(key: _kRadioKey, items: data, toJson: (s) => s.toJson());
    return data;
  }

  @override
  Future<List<ReciterModel>> getReciters({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _load<ReciterModel>(
        key: _kRecitersKey,
        fromJson: ReciterModel.fromJson,
      );
      if (cached != null) return cached;
    }
    final data = await _remote.getReciters();
    await _save(key: _kRecitersKey, items: data, toJson: (r) => r.toJson());
    return data;
  }

  Future<Box<String>> get _box async => Hive.isBoxOpen(_kRadioBox)
      ? Hive.box<String>(_kRadioBox)
      : await Hive.openBox<String>(_kRadioBox);

  Future<List<T>?> _load<T>({
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final raw = (await _box).get(key);
      if (raw == null || raw.isEmpty) return null;
      return (jsonDecode(raw) as List)
          .whereType<Map<String, dynamic>>()
          .map(fromJson)
          .toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> _save<T>({
    required String key,
    required List<T> items,
    required Map<String, dynamic> Function(T) toJson,
  }) async {
    try {
      await (await _box).put(key, jsonEncode(items.map(toJson).toList()));
    } catch (_) {}
  }
}

/// Call once in main() before runApp().
class RadioCacheInit {
  const RadioCacheInit._();

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen(_kRadioBox)) {
      await Hive.openBox<String>(_kRadioBox);
    }
  }
}