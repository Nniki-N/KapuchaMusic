import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kapuha_music/ui/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  const myApp = MyApp();
  runApp(myApp);
}
