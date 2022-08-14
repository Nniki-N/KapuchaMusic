import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/session_data_provider.dart';
import 'package:kapuha_music/ui/navigation/main_navigation.dart';

class LoaderCubit extends Cubit<String?> {
  final _sessionDataProvider = SessionDataProvider();
  BuildContext context;

  LoaderCubit(this.context) : super('');

  void init() async {
    final isAuth = await checkFirstLoad();
    if (isAuth) {
      Navigator.of(context).pushNamedAndRemoveUntil(MainNavigationRouteNames.mainPage, (route) => false);
    }
    else {
      Navigator.of(context).pushNamedAndRemoveUntil(MainNavigationRouteNames.startPage, (route) => false);
    }
  }

  Future<bool> checkFirstLoad() async {
    final apiKey = await _sessionDataProvider.apiKey();
    return apiKey != null;
  }
}