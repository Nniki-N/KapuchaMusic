// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kapuha_music/domain/entity/user.dart';

class Users {
  final List<User> usersList;

  Users({
    required this.usersList,
  });


  Users copyWith({
    List<User>? usersList,
  }) {
    return Users(
      usersList: usersList ?? this.usersList,
    );
  }
}
