// ============================================================
// radio_remote_data_source.dart
// Place: lib/modules/layout/radio/radio_remote_data_source.dart
// ============================================================

import 'package:dio/dio.dart';
import 'package:islami/modules/layout/radio/radio_station_model.dart';
import 'package:islami/modules/layout/radio/reciter_model.dart';

abstract class RadioRemoteDataSource {
  Future<List<RadioStationModel>> getRadioStations();
  Future<List<ReciterModel>> getReciters();
}

class RadioRemoteDataSourceImpl implements RadioRemoteDataSource {
  RadioRemoteDataSourceImpl({Dio? dio}) : _dio = dio ?? _buildDio();

  final Dio _dio;

  static const String _baseUrl = 'https://www.mp3quran.net/api/v3';
  static const Map<String, String> _params = {'language': 'ar'};

  @override
  Future<List<RadioStationModel>> getRadioStations() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/radios',
        queryParameters: _params,
      );
      final list = (response.data?['radios'] as List<dynamic>?) ?? [];
      return list
          .whereType<Map<String, dynamic>>()
          .map(RadioStationModel.fromJson)
          .where((s) => s.streamUrl.isNotEmpty)
          .toList();
    } on DioException catch (e) {
      throw RadioApiException(_dioMessage(e));
    }
  }

  @override
  Future<List<ReciterModel>> getReciters() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reciters',
        queryParameters: _params,
      );
      final list = (response.data?['reciters'] as List<dynamic>?) ?? [];
      return list
          .whereType<Map<String, dynamic>>()
          .map(ReciterModel.fromJson)
          .where((r) => r.defaultStreamUrl != null)
          .toList();
    } on DioException catch (e) {
      throw RadioApiException(_dioMessage(e));
    }
  }

  static Dio _buildDio() => Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: const {'Accept': 'application/json'},
    ),
  );

  static String _dioMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Request timed out. Check your connection.';
      case DioExceptionType.badResponse:
        return 'Server error ${e.response?.statusCode}.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      default:
        return e.message ?? 'An unexpected error occurred.';
    }
  }
}

class RadioApiException implements Exception {
  const RadioApiException(this.message);
  final String message;

  @override
  String toString() => 'RadioApiException: $message';
}