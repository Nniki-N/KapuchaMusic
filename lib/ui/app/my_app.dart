import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/domain/blocs/start_cubit.dart';
import 'package:kapuha_music/ui/navigation/main_navigation.dart';
import 'package:kapuha_music/ui/pages/start_page/start_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainNavigation = MainNavigation();

    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Gilroy'),
            title: 'KAPUTA music',
            initialRoute: MainNavigationRouteNames.loaderPage,
            routes: mainNavigation.routes,
          );
        });
  }
}
