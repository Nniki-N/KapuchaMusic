import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kapuha_music/domain/data_providers/search_people_provider.dart';
import 'package:kapuha_music/domain/entity/user/users.dart';

class PeopleCubit extends Cubit<Users> {
  final _peopleProvider = PeopleProvider();
  Timer? searchDebounce;
  String? _searchQuery;

  bool get isSearchMode {
    final searchQuery = _searchQuery;
    return searchQuery != null && searchQuery.isNotEmpty;
  }

  PeopleCubit() : super(Users(usersList: []));

  int getLength() => state.usersList.length;
  String getUserName(int index) => state.usersList[index].userName;
  String getAvatarPath(int index) => state.usersList[index].avatarPath;

  void loadPeople() {
    final usersList = _peopleProvider.loadValue();
    final newState = state.copyWith(usersList: usersList);
    emit(newState);
  }

  void _loadPeople(String text) {
    if (isSearchMode) {
      final usersList = _peopleProvider
          .loadValue()
          .where((element) => element.userName.contains(text))
          .toList();
      final newState = state.copyWith(usersList: usersList);
      emit(newState);
    } else {
      final newState = state.copyWith(usersList: []);
      emit(newState);
    }
  }

  Future<void> searchPeople(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 250), () {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;

      final newState = state.copyWith(usersList: []);
      emit(newState);

      _loadPeople(text);
    });
  }
}
