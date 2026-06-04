// ============================================================
// reciter_model.dart
// Place: lib/modules/layout/radio/reciter_model.dart
// ============================================================

class MoshafModel {
  final int id;
  final String name;
  final String server;
  final String surasList;

  const MoshafModel({
    required this.id,
    required this.name,
    required this.server,
    required this.surasList,
  });

  factory MoshafModel.fromJson(Map<String, dynamic> json) {
    return MoshafModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '',
      server: (json['server'] as String?) ?? '',
      surasList: (json['surasList'] as String?) ?? '',
    );
  }

  /// Returns the stream URL for [suraNumber] (1-indexed).
  String? buildSuraUrl(int suraNumber) {
    if (server.isEmpty) return null;
    final base = server.endsWith('/') ? server : '$server/';
    final padded = suraNumber.toString().padLeft(3, '0');
    return '$base$padded.mp3';
  }

  /// URL of the first available sura — used as default preview stream.
  String? get firstSuraUrl {
    final suras = surasList
        .split(',')
        .where((s) => s.trim().isNotEmpty)
        .map((s) => int.tryParse(s.trim()))
        .whereType<int>()
        .toList();
    if (suras.isEmpty) return null;
    return buildSuraUrl(suras.first);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'server': server,
    'surasList': surasList,
  };
}

class ReciterModel {
  final int id;
  final String name;
  final String letter;
  final List<MoshafModel> moshafs;

  const ReciterModel({
    required this.id,
    required this.name,
    required this.letter,
    required this.moshafs,
  });

  /// Default stream URL — first sura of the first moshaf.
  String? get defaultStreamUrl =>
      moshafs.isNotEmpty ? moshafs.first.firstSuraUrl : null;

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    final moshafList = (json['moshaf'] as List<dynamic>?) ?? [];
    return ReciterModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? 'Unknown Reciter',
      letter: (json['letter'] as String?) ?? '',
      moshafs: moshafList
          .whereType<Map<String, dynamic>>()
          .map(MoshafModel.fromJson)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'letter': letter,
    'moshaf': moshafs.map((m) => m.toJson()).toList(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ReciterModel && other.id == id);

  @override
  int get hashCode => id.hashCode;
}