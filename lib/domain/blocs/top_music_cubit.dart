// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kapuha_music/domain/data_providers/top_music_provider.dart';
import 'package:kapuha_music/domain/entity/music.dart';


class TopMusicCubit extends Cubit<Music> {
  final _topMusicProvider = TopMusicProvider();

  TopMusicCubit() : super(Music(musicList: [])) {
    _initialize();
  }

  void _initialize() {
    final musicList = _topMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  int getLength() => state.musicList.length;

  String getImagePath(int index) => state.musicList[index]['imagePath'];
  String getText(int index) => state.musicList[index]['text'];
  
  void loadMusic() {
    final musicList = _topMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  void loadNewMusic() {
    final musicList =  _topMusicProvider.loadValue();
    final newState = state.copyWith(musicList: state.musicList + musicList);
    emit(newState);
  }
}