import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/domain/blocs/start_cubit.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/navigation/main_navigation.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:kapuha_music/ui/utils/layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.pink,
              AppColors.darkBlue,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _IntroducingText(),
            const _Title(),
            _StartList(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [_ButtonStart()],
            )
          ],
        ),
      ),
    );
  }
}

class _IntroducingText extends StatelessWidget {
  const _IntroducingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 36.w, top: 55.h),
      width: AppLayout.getWidth(context, value: 0.3),
      child: Text(
        'social network\nfor people\nwho wants to find\nsoulmates',
        textAlign: TextAlign.center,
        style: FontStyles.style14.copyWith(
          color: HexColor.fromHex('#D6D6D6'),
          height: 2,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w, bottom: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'music',
                style: FontStyles.style16.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'KAPUTA',
                style: FontStyles.styleBigText.copyWith(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StartList extends StatelessWidget {
  final startList = <Map<String, dynamic>>[
    {
      'image': Svgs.startPageFirst,
      'text': 'add your favorite music',
    },
    {
      'image': Svgs.startPageSecond,
      'text': 'find friends, who likes the same music',
    },
    {
      'image': Svgs.startPageThird,
      'text': 'chat with them',
    },
  ];

  _StartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 360.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => _StartListItem(
          list: startList,
          index: index,
        ),
        itemCount: startList.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 9.w);
        },
      ),
    );
  }
}

class _StartListItem extends StatelessWidget {
  final List list;
  final int index;
  const _StartListItem({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 319.h,
          width: 216.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23.h),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 270.h,
                child: SvgPicture.asset(list[index]['image']),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                child: Text(
                  list[index]['text'],
                  textAlign: TextAlign.center,
                  style: FontStyles.style14.copyWith(
                    color: AppColors.pink,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 5.w,
          bottom: -15.h,
          child: Text(
            (index + 1).toString(),
            style: FontStyles.styleBigText.copyWith(
              color: AppColors.pink,
              fontSize: 80.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}

class _ButtonStart extends StatelessWidget {
  const _ButtonStart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<StartCubit>();

    return GestureDetector(
      onTap: () {
        cubit.firstEnter();
        Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.mainPage);
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.w, bottom: 40.h),
        width: 160.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.h),
          color: AppColors.pink,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'start',
              style: FontStyles.style16.copyWith(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset(Svgs.arrowNext),
            )
          ],
        ),
      ),
    );
  }
}
