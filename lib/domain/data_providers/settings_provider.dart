import 'package:kapuha_music/domain/entity/setting_items/setting_item.dart';
import 'package:kapuha_music/resources/resources.dart';

class SettingsProvider {
  var _chatUsersList = <SettingItem>[
    SettingItem(imagePath: Svgs.chat, settingTitle: 'Saved Message'),
    SettingItem(imagePath: Svgs.chat, settingTitle: 'Saved Message'),
    SettingItem(imagePath: Svgs.chat, settingTitle: 'Saved Message'),
    SettingItem(imagePath: Svgs.chat, settingTitle: 'Saved Message'),
  ];

  List<SettingItem> loadValue(){
    return _chatUsersList;
  }

  void saveValue(List<SettingItem> list){
    _chatUsersList = list;
  }
}
