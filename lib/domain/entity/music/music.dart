// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/adapters.dart';

part 'music.g.dart';

@HiveType(typeId: 1)
class Music {
  
  @HiveField(0)
  final String imagePath;
  @HiveField(1)
  final String songName;
  @HiveField(2)
  final String album;
  @HiveField(3)
  final int listening;
  @HiveField(4)
  final bool isFavourite;

  Music({
    required this.imagePath,
    required this.songName,
    required this.album,
    required this.listening,
    required this.isFavourite,
  });

  Music copyWith({
    String? imagePath,
    String? songName,
    String? album,
    int? listening,
    bool? isFavourite,
  }) {
    return Music(
      imagePath: imagePath ?? this.imagePath,
      songName: songName ?? this.songName,
      album: album ?? this.album,
      listening: listening ?? this.listening,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
