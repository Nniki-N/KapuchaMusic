import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapuha_music/domain/data_providers/session_data_provider.dart';

class StartCubit extends Cubit<String?> {
  final _sessionDataProvider = SessionDataProvider();
  BuildContext context;

  StartCubit(this.context) : super('');

  Future<void> firstEnter() async {
    const apiKey = 'Enter';
    await _sessionDataProvider.saveApiKey(apiKey);
    emit(apiKey);
  }
}
