import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/most_listening_music_provider.dart';
import 'package:kapuha_music/domain/data_providers/my_music_provider.dart';
import 'package:kapuha_music/domain/entity/music/music.dart';
import 'package:kapuha_music/domain/entity/music/music_collection.dart';



class MostListeningMusicCubit extends Cubit<MusicCollection> {
  final _mostListeningMusicProvider = MostListeningMusicProvider();
  final _myMusicProvider = MyMusicProvider();

  MostListeningMusicCubit() : super(MusicCollection(musicList: [])) {
    _initialize();
  }

  void _initialize() {
    final musicList = _mostListeningMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  int getLength() => state.musicList.length;

  Music getMusic(int index) => state.musicList[index];
  String getImagePath(int index) => state.musicList[index].imagePath;
  String getSongName(int index) => state.musicList[index].songName;
  String getAlbum(int index) => state.musicList[index].album;
  int getListening(int index) => state.musicList[index].listening;
  
  void loadMusic() {
    final musicList = _mostListeningMusicProvider.loadValue();
    final newState = state.copyWith(musicList: musicList);
    emit(newState);
  }

  Future<void> addToMyMusic(Music music) async{
    _myMusicProvider.addMusic(music);
    loadMusic();
  }
}