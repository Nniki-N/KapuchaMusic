class ChatUser {
  final String userName;
  final String userAvatar;
  final String lastMessage;
  final String lastMessageTime;
  final int unreadMessages;

  ChatUser({
    required this.userName,
    required this.userAvatar,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadMessages,
  });
}
