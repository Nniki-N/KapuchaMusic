import 'package:kapuha_music/resources/resources.dart';

class TopMusicProvider {
  var _musicList = <Map<String, dynamic>>[
      {'imagePath': Images.img1, 'text': 'Lil Nas X, Nas Rodeo'},
      {'imagePath': Images.img2, 'text': 'Lil Nas X, Nas Rodeo'},
      {'imagePath': Images.img3, 'text': 'Lil Nas X, Nas Rodeo'},
      {'imagePath': Images.img4, 'text': 'Lil Nas X, Nas Rodeo'},
      {'imagePath': Images.img5, 'text': 'Lil Nas X, Nas Rodeo'},
    ];

  List<Map<String, dynamic>> loadValue(){
    return _musicList;
  }

  void saveValue(List<Map<String, dynamic>> list){
    _musicList = list;
  }
}