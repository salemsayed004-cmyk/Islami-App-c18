// ============================================================
// radio_station_model.dart
// Place: lib/modules/layout/radio/radio_station_model.dart
// ============================================================

class RadioStationModel {
  final int id;
  final String name;
  final String streamUrl;
  final String? serverName;

  const RadioStationModel({
    required this.id,
    required this.name,
    required this.streamUrl,
    this.serverName,
  });

  factory RadioStationModel.fromJson(Map<String, dynamic> json) {
    return RadioStationModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? 'Unknown Station',
      streamUrl: (json['url'] as String?) ?? '',
      serverName: json['serverName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'url': streamUrl,
    'serverName': serverName,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is RadioStationModel && other.id == id);

  @override
  int get hashCode => id.hashCode;
}