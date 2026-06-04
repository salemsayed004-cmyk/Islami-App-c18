// ============================================================
// radio_di.dart
// Place: lib/modules/layout/radio/radio_di.dart
// ============================================================

import 'package:dio/dio.dart';
import 'package:islami/modules/layout/radio/radio_remote_data_source.dart';
import 'package:islami/modules/layout/radio/radio_repository.dart';
import 'package:islami/modules/layout/radio/radio_cubit.dart';

/// Wires up the full dependency chain and returns a ready-to-use [RadioCubit].
/// Called inside BlocProvider in radio_view.dart.
RadioCubit buildRadioCubit() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.mp3quran.net/api/v3',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: const {'Accept': 'application/json'},
    ),
  );
  final remote = RadioRemoteDataSourceImpl(dio: dio);
  final repo   = RadioRepositoryImpl(remoteDataSource: remote);
  return RadioCubit(repository: repo);
}