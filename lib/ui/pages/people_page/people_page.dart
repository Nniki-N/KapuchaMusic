import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/pages/people_page/people_list.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:kapuha_music/ui/widgets/header.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listHeaderButtons = <Map<String, dynamic>>[
      {
        'imagePath': Svgs.chat,
        'onTap': () {},
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.lightGreyBg,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 140.h),
              const _TextField(),
              SizedBox(height: 20.h),
              PeopleList(),
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

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find people',
            style: FontStyles.style18.copyWith(color: Colors.black),
          ),
          SizedBox(height: 15.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.h),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    showCursor: false,
                    decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Username',
                        contentPadding: EdgeInsets.zero),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(Svgs.magnifier),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
