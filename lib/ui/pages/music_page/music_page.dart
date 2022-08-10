import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/pages/music_page/most_listening.dart';
import 'package:kapuha_music/ui/pages/music_page/top_music.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/widgets/header.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({Key? key}) : super(key: key);

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
            children: const [
              TopMusic(),
              MostListening(),
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
