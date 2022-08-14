

import 'package:kapuha_music/domain/entity/user/user.dart';
import 'package:kapuha_music/resources/resources.dart';

class PeopleProvider {
  var _peopleList = <User>[
      User(userName: 'first user', avatarPath: Images.avatar),
      User(userName: 'second user', avatarPath: Images.avatar),
      User(userName: 'third user', avatarPath: Images.avatar),
      User(userName: 'fourth user', avatarPath: Images.avatar),
      User(userName: 'fifth user', avatarPath: Images.avatar),
      User(userName: 'sixth user', avatarPath: Images.avatar),
      User(userName: 'seventh user', avatarPath: Images.avatar),
      User(userName: 'eighth user', avatarPath: Images.avatar),
      User(userName: 'nenth user', avatarPath: Images.avatar),
      User(userName: 'tenth user', avatarPath: Images.avatar),
      User(userName: '11 user', avatarPath: Images.avatar),
      User(userName: '12 user', avatarPath: Images.avatar),
      User(userName: '13 user', avatarPath: Images.avatar),
      User(userName: '14 user', avatarPath: Images.avatar),
      User(userName: '15 user', avatarPath: Images.avatar),
      User(userName: '16 user', avatarPath: Images.avatar),
      User(userName: '17 user', avatarPath: Images.avatar),
      User(userName: '18 user', avatarPath: Images.avatar),
      User(userName: '19 user', avatarPath: Images.avatar),
      User(userName: '20 user', avatarPath: Images.avatar),
    ];

  List<User> loadValue(){
    return _peopleList;
  }

  void saveValue(List<User> list) {
    _peopleList = list;
  }
}