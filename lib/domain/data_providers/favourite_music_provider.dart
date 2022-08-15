import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kapuha_music/domain/data_providers/boxes/box_manager.dart';
import 'package:kapuha_music/domain/entity/music/music.dart';

class FavouriteMusicProvider {
  late final Future<Box<Music>> _box;
  var _music = <Music>[];
  ValueListenable<Object>? _listenableBox;

  FavouriteMusicProvider() {
    _setup();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openMyMusicBox();
    await _readMusicFromHive();
    _listenableBox = (await _box).listenable();
    _listenableBox?.addListener(_readMusicFromHive);
  }

  Future<void> _readMusicFromHive() async {
    _music = (await _box).values.where((element) => element.isFavourite).toList();
  }

  Future<List<Music>> loadMusic() async {
    await _readMusicFromHive();
    return _music;
  }

  Future<void> removeFromFavourite(Music music) async {
    final box = await _box;
    final index = box.values.toList().indexOf(music);
    await box.putAt(index, music.copyWith(isFavourite: !music.isFavourite));
  }

  Future<void> deleteMusic(Music music) async {
    final box = await _box;
    final index = box.values.toList().indexOf(music);
    await box.deleteAt(index);
  }
}
