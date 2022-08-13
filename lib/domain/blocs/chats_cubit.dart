import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/chats_provider.dart';
import 'package:kapuha_music/domain/entity/chat_users.dart';

class ChatsCubit extends Cubit<ChatUsers> {
  final _chatsProvider = ChatsProvider();

  ChatsCubit() : super(ChatUsers(chatUsersList: [])) {
    _initialize();
  }

  void _initialize() {
    final usersList = _chatsProvider.loadValue();
    final newState = state.copyWith(chatUsersList: usersList);
    emit(newState);
  }

  int getLength() => state.chatUsersList.length;
  String getUserName(int index) => state.chatUsersList[index].userName;
  String getAvatarPath(int index) => state.chatUsersList[index].userAvatar;
  String getLastMessage(int index) => state.chatUsersList[index].lastMessage;
  String getLastMessageTime(int index) =>
      state.chatUsersList[index].lastMessageTime;
  int getUnreadMessages(int index) => state.chatUsersList[index].unreadMessages;

  void loadPeople() {
    final usersList = _chatsProvider.loadValue();
    final newState = state.copyWith(chatUsersList: usersList);
    emit(newState);
  }

  void loadNewPeople() {
    final usersList = _chatsProvider.loadValue();
    final newState =
        state.copyWith(chatUsersList: state.chatUsersList + usersList);
    emit(newState);
  }
}
