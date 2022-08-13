import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/most_listening_music_provider.dart';
import 'package:kapuha_music/domain/entity/music.dart';



class MostListeningMusicCubit extends Cubit<Music> {
  final _mostListeningMusicProvider = MostListeningMusicProvider();

  MostListeningMusicCubit() : super(Music(musicList: [])) {
    _initialize();
  }

  void _initialize() {
    final musicList = _mostListeningMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  int getLength() => state.musicList.length;

  String getImagePath(int index) => state.musicList[index]['imagePath'];
  String getSongName(int index) => state.musicList[index]['songName'];
  String getAlbum(int index) => state.musicList[index]['album'];
  int getListening(int index) => state.musicList[index]['listening'];
  
  void loadMusic() {
    final musicList = _mostListeningMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  void loadNewMusic() async {
    final musicList = _mostListeningMusicProvider.loadValue();
    final newState = state.copyWith(musicList: state.musicList + musicList);
    emit(newState);
  }
}