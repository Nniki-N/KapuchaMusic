import 'package:flutter/material.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/pages/chats_page/chats_list.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/ui/widgets/header.dart';
import 'package:kapuha_music/ui/widgets/title_row.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listHeaderButtons = <Map<String, dynamic>>[
      {
        'imagePath': Svgs.addContact,
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
              TitleRow(
                  firstText: 'Chats',
                  secondText: 'add new',
                  onTap: () {},
                  spacer: true),
              SizedBox(height: 20.h),
              ChatsList()
            ],
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Header(
              listButtons: listHeaderButtons,
            ),
          ),
        ],
      ),
    );
  }
}
