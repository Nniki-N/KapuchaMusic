import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/favourite_music_provider.dart';
import 'package:kapuha_music/domain/data_providers/my_music_provider.dart';
import 'package:kapuha_music/domain/entity/music/music.dart';
import 'package:kapuha_music/domain/entity/music/music_collection.dart';

class MyMusicCubit extends Cubit<MusicCollection> {
  final _myMusicProvider = MyMusicProvider();
  final _favouriteMusicProvider = FavouriteMusicProvider();

  MyMusicCubit() : super(MusicCollection(musicList: [])) {
    _initialize();
  }

  void _initialize() async{
    final musicList = await _myMusicProvider.loadMusic();
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
  
  void loadMusic() async {
    final musicList = await _myMusicProvider.loadMusic();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  Future<void> addToFavouriteMusic(Music music) async{
    _myMusicProvider.addToFavouriteMusic(music);
    loadMusic();
  }

  Future<void> removeFromFavouriteMusic(Music music) async{
    _myMusicProvider.removeFromFavouriteMusic(music);
    loadMusic();
  }

  Future<void> deleteFromMyMusic(int index) async{
    _myMusicProvider.deleteMusic(index);
    loadMusic();
  }
}