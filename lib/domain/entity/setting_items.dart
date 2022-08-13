// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kapuha_music/domain/entity/setting_item.dart';

class SettingItems {
  final List<SettingItem> settingItemsList;

  SettingItems({required this.settingItemsList});

  SettingItems copyWith({
    List<SettingItem>? settingItemsList,
  }) {
    return SettingItems(
      settingItemsList: settingItemsList ?? this.settingItemsList,
    );
  }
}
