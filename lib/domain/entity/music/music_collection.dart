
import 'package:kapuha_music/domain/entity/music/music.dart';

class MusicCollection {
  final List<Music> musicList;

  MusicCollection({required this.musicList});

  MusicCollection copyWith({
    List<Music>? musicList,
  }) {
    return MusicCollection(
      musicList: musicList ?? this.musicList,
    );
  }
}
