import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/blocs/loader_cubit.dart';
import 'package:kapuha_music/domain/blocs/start_cubit.dart';
import 'package:kapuha_music/ui/pages/chat_page/chat_page.dart';
import 'package:kapuha_music/ui/pages/loader_page/loader_page.dart';
import 'package:kapuha_music/ui/pages/main_page/main_page.dart';
import 'package:kapuha_music/ui/pages/start_page/start_page.dart';

class MainNavigationRouteNames {
  static const startPage = 'startPage';
  static const loaderPage = 'sloaderPage';
  static const mainPage = '/main';
  static const chatPage = '/main/chat';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainPage: (context) => const MainPage(),
    MainNavigationRouteNames.startPage: (context) => BlocProvider(
          create: (context) => StartCubit(context),
          child: const StartPage(),
        ),
    MainNavigationRouteNames.loaderPage: (context) => BlocProvider(
          create: (_) => LoaderCubit(context),
          child: const LoaderPage(),
        ),
    MainNavigationRouteNames.chatPage: (context) => const ChatPage(),
  };
}
