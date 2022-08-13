// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kapuha_music/domain/entity/chat_user.dart';

class ChatUsers {
  final List<ChatUser> chatUsersList;

  ChatUsers({required this.chatUsersList});

  ChatUsers copyWith({
    List<ChatUser>? chatUsersList,
  }) {
    return ChatUsers(
      chatUsersList: chatUsersList ?? this.chatUsersList,
    );
  }
}
