import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/my_music_provider.dart';
import 'package:kapuha_music/domain/entity/music.dart';

class MyMusicCubit extends Cubit<Music> {
  final _myMusicProvider = MyMusicProvider();

  MyMusicCubit() : super(Music(musicList: [])) {
    _initialize();
  }

  void _initialize() {
    final musicList = _myMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  int getLength() => state.musicList.length;

  String getImagePath(int index) => state.musicList[index]['imagePath'];
  String getSongName(int index) => state.musicList[index]['songName'];
  String getAlbum(int index) => state.musicList[index]['album'];
  int getListening(int index) => state.musicList[index]['listening'];
  
  void loadMusic() {
    final musicList = _myMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  void loadNewMusic() {
    final musicList = _myMusicProvider.loadValue();
    final newState = state.copyWith(musicList: state.musicList + musicList);
    emit(newState);
  }
}