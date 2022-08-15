import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/favourite_music_provider.dart';
import 'package:kapuha_music/domain/entity/music/music.dart';
import 'package:kapuha_music/domain/entity/music/music_collection.dart';

class FavouriteMusicCubit extends Cubit<MusicCollection> {
  final _favouriteMusicProvider = FavouriteMusicProvider();

  FavouriteMusicCubit() : super(MusicCollection(musicList: [])) {
    _initialize();
  }

  Future<void> _initialize() async {
    final musicList = await _favouriteMusicProvider.loadMusic();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  int getLength() => state.musicList.length;

  Music getMusic(int index) => state.musicList[index];
  String getImagePath(int index) => state.musicList[index].imagePath;
  String getSongName(int index) => state.musicList[index].songName;
  String getAlbum(int index) => state.musicList[index].album;
  int getListening(int index) => state.musicList[index].listening;
  bool getisFavourite(int index) => state.musicList[index].isFavourite;

  Future<void> loadMusic() async {
    final musicList = await _favouriteMusicProvider.loadMusic();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  Future<void> removeFromFavourite(Music music) async {
    _favouriteMusicProvider.removeFromFavourite(music);
    loadMusic();
  }

  Future<void> deleteMusic(Music music) async {
    _favouriteMusicProvider.deleteMusic(music);
    loadMusic();
  }
}
