import 'package:kapuha_music/domain/entity/music/music.dart';
import 'package:kapuha_music/resources/resources.dart';

class TopMusicProvider {
  var _musicList = <Music>[
    Music(
      imagePath: Images.img1,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
    ),
    Music(
      imagePath: Images.img2,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
    ),
    Music(
      imagePath: Images.img3,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
    ),
    Music(
      imagePath: Images.img4,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
    ),
    Music(
      imagePath: Images.img5,
      songName: 'Lil Nas X, Nas - Rodeo',
      album: '7 Ep',
      listening: 6125,
    ),
  ];

  List<Music> loadValue(){
    return _musicList;
  }

  void saveValue(List<Music> list){
    _musicList = list;
  }
}