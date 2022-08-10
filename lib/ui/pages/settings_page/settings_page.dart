import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/pages/settings_page/settings_list.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/widgets/header.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listHeaderButtons = <Map<String, dynamic>>[
      {
        'imagePath': Svgs.addContact,
        'onTap': () {},
      },
      {
        'imagePath': Svgs.chat,
        'onTap': () {},
      },
    ];
    
    return Scaffold(
      backgroundColor: AppColors.lightGreyBg,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(top: 140.h),
            children: [
              SettingsList(),
            ],
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Header(listButtons: listHeaderButtons,),
          ),
        ],
      ),
    );
  }
}