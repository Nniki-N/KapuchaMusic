import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/settings_provider.dart';
import 'package:kapuha_music/domain/entity/setting_items/setting_items.dart';

class SettingsCubit extends Cubit<SettingItems> {
  final _settingsProvider = SettingsProvider();

  SettingsCubit() : super (SettingItems(settingItemsList: [])) {
    _initialize();
  }

  void _initialize() {
    final usersList = _settingsProvider.loadValue();
    final newState = state.copyWith(settingItemsList: usersList);
    emit(newState);
  }

  int getLength() => state.settingItemsList.length;
  String getImagePath(int index) => state.settingItemsList[index].imagePath;
  String getSettingTitle(int index) => state.settingItemsList[index].settingTitle;
  
  void loadSettingList() {
    final usersList = _settingsProvider.loadValue();
    final newState = state.copyWith(settingItemsList: usersList);
    emit(newState);
  }

}