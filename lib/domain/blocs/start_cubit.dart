import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/session_data_provider.dart';
import 'package:kapuha_music/ui/navigation/main_navigation.dart';

class StartCubit extends Cubit<String?> {
  final _sessionDataProvider = SessionDataProvider();
  BuildContext context;

  StartCubit(this.context) : super('') {
    init();
  }

  void init() async {
    final isAuth = await checkFirstLoad();
    if (isAuth) {
      Navigator.of(context).pushNamedAndRemoveUntil(MainNavigationRouteNames.mainPage, (route) => false);
    }
  }

  Future<bool> checkFirstLoad() async {
    final apiKey = await _sessionDataProvider.apiKey();
    return apiKey != null;
  }

  Future<void> firstEnter() async {
    const apiKey = 'Enter';
    await _sessionDataProvider.saveApiKey(apiKey);
    emit(apiKey);
  }
}
