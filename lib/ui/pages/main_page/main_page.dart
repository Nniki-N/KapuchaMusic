import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/pages/chats_page/chats_page.dart';
import 'package:kapuha_music/ui/pages/home_page/home_page.dart';
import 'package:kapuha_music/ui/pages/music_page/music_page.dart';
import 'package:kapuha_music/ui/pages/people_page/people_page.dart';
import 'package:kapuha_music/ui/pages/settings_page/settings_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  final listPages = [
    const MusicPage(),
    const PeoplePage(),
    const HomePage(),
    const ChatsPage(),
    const SettingsPage(),
  ];

  void onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _CustomBottomNavigationBar(
        onTap: onTap,
        currentIndex: _currentIndex,
      ),
      body: listPages[_currentIndex],
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final void Function(dynamic) onTap;
  final int currentIndex;
  const _CustomBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listImagesAndLabels = <Map<String, dynamic>>[
      {'path': Svgs.noteMenu, 'label': 'Music'},
      {'path': Svgs.peopleMenu, 'label': 'People'},
      {'path': Svgs.homeMenu, 'label': 'Home'},
      {'path': Svgs.chatMenu, 'label': 'Chats'},
      {'path': Svgs.burgerMenu, 'label': 'Settings'},
    ];

    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 60,
                offset: Offset(0, 4.h),
                color: HexColor.fromHex('#8F8F8F').withOpacity(0.2)),
            BoxShadow(
                blurRadius: 2,
                color: HexColor.fromHex('#B8B8B8').withOpacity(0.2)),
          ],
        ),
        child: BottomNavigationBar(
          onTap: onTap,
          iconSize: 20.h,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: listImagesAndLabels
              .map((item) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    item['path'],
                    color: currentIndex == listImagesAndLabels.indexOf(item)
                        ? AppColors.pink
                        : HexColor.fromHex('#929FAD'),
                  ),
                  label: item['label']))
              .toList(),
        ),
      ),
    );
  }
}
