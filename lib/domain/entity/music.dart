
class Music {
  final List<Map<String, dynamic>> musicList;

  Music({required this.musicList});

  Music copyWith({
    List<Map<String, dynamic>>? musicList,
  }) {
    return Music(
      musicList: musicList ?? this.musicList,
    );
  }
}
