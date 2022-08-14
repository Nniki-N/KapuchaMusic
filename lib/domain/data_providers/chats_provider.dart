import 'package:kapuha_music/domain/entity/chats/chat_user.dart';
import 'package:kapuha_music/resources/resources.dart';

class ChatsProvider {
  var _chatUsersList = <ChatUser>[
    ChatUser(
      userName: 'user name 1',
      userAvatar: Images.avatar,
      lastMessage:
          'sfjkd sdlkf sk sl; ksnnv l;sdf rlk  v;l;s n srlkkmf ksdflksdfan askfmglksnrknwnej  cksdkf;sekfjlkejl s ldsdfnjdejesfn sdlkvksn',
      lastMessageTime: 'Wed',
      unreadMessages: 3,
    ),
    ChatUser(
      userName: 'user name 2',
      userAvatar: Images.avatar,
      lastMessage:
          'sfjkd sdlkf sk sl; ksnnv l;sdf rlk  v;l;s n srlkkmf ksdflksdfan askfmglksnrknwnej  cksdkf;sekfjlkejl s ldsdfnjdejesfn sdlkvksn',
      lastMessageTime: 'Mon',
      unreadMessages: 0,
    ),
    ChatUser(
      userName: 'user name 3',
      userAvatar: Images.avatar,
      lastMessage:
          'sfjkd sdlkf sk sl; ksnnv l;sdf rlk  v;l;s n srlkkmf ksdflksdfan askfmglksnrknwnej  cksdkf;sekfjlkejl s ldsdfnjdejesfn sdlkvksn',
      lastMessageTime: 'Fri',
      unreadMessages: 43,
    ),
    ChatUser(
      userName: 'user name 4',
      userAvatar: Images.avatar,
      lastMessage:
          'sfjkd sdlkf sk sl; ksnnv l;sdf rlk  v;l;s n srlkkmf ksdflksdfan askfmglksnrknwnej  cksdkf;sekfjlkejl s ldsdfnjdejesfn sdlkvksn',
      lastMessageTime: 'Sat',
      unreadMessages: 122,
    ),
  ];

  List<ChatUser> loadValue(){
    return _chatUsersList;
  }

  void saveValue(List<ChatUser> list){
    _chatUsersList = list;
  }
}
