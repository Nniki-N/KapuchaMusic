import 'package:kapuha_music/resources/resources.dart';

class MostListeningMusicProvider {
  var _musicList = <Map<String, dynamic>>[
    {
      'imagePath': Images.img6,
      'songName': 'Lil Nas X, Nas - Rodeo',
      'album': '7 Ep',
      'listening': 6125
    },
    {
      'imagePath': Images.img7,
      'songName': 'Lil Nas X, Nas - Rodeo',
      'album': '7 Ep',
      'listening': 6125
    },
    {
      'imagePath': Images.img8,
      'songName': 'Lil Nas X, Nas - Rodeo',
      'album': '7 Ep',
      'listening': 6125
    },
  ];

  List<Map<String, dynamic>> loadValue() {
    return _musicList;
  }

  void saveValue(List<Map<String, dynamic>> list) {
    _musicList = list;
  }
}
