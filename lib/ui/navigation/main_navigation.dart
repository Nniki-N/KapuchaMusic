import 'package:flutter/material.dart';
import 'package:kapuha_music/ui/pages/chat_page/chat_page.dart';
import 'package:kapuha_music/ui/pages/main_page/main_page.dart';
import 'package:kapuha_music/ui/pages/start_page/start_page.dart';

class MainNavigationRouteNames {
  static const startPage = 'startPage';
  static const mainPage = '/main';
  static const chatPage = '/main/chat';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainPage: (context) => const MainPage(),
    MainNavigationRouteNames.startPage: (context) => const StartPage(),
    MainNavigationRouteNames.chatPage: (context) => const ChatPage(),
  };
}
