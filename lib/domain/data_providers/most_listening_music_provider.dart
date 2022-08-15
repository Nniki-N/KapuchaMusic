import 'package:kapuha_music/domain/entity/music/music.dart';
import 'package:kapuha_music/resources/resources.dart';

class MostListeningMusicProvider {
  var _musicList = <Music>[
    Music(
      imagePath: Images.img6,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
      isFavourite: false,
    ),
    Music(
      imagePath: Images.img7,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
      isFavourite: false,
    ),
    Music(
      imagePath: Images.img8,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
      isFavourite: false,
    ),
  ];

  List<Music> loadValue() {
    return _musicList;
  }

  void saveValue(List<Music> list) {
    _musicList = list;
  }
}
