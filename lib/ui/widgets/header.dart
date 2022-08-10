import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final List<Map<String, dynamic>> listButtons;
  const Header({
    Key? key,
    required this.listButtons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 25.w, top: 45.h, right: 25.w, bottom: 15.h),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.pink,
            AppColors.darkBlue,
          ],
        ),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.h)),
      ),
      child: Row(
        children: [
          const _HeaderAvatar(),
          SizedBox(width: 10.w),
          const _HeaderUserInfo(),
          const Spacer(),
          _HeaderButtons(listButtons: listButtons)
        ],
      ),
    );
  }
}

class _HeaderAvatar extends StatelessWidget {
  const _HeaderAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.w, color: Colors.white),
        image: const DecorationImage(
            image: AssetImage(Images.avatar), fit: BoxFit.cover),
      ),
    );
  }
}

class _HeaderUserInfo extends StatelessWidget {
  const _HeaderUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connie Pena',
          style: FontStyles.style18.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'United States, Peoria',
          style: FontStyles.styleSmallText.copyWith(
            fontSize: 10.sp,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          'July 21, 2019',
          style: FontStyles.styleSmallText.copyWith(
            fontSize: 10.sp,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class _HeaderButtons extends StatelessWidget {
  final List<Map<String, dynamic>> listButtons;
  const _HeaderButtons({
    Key? key,
    required this.listButtons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 17.5.h),
        Row(
          children: listButtons
              .map((buttom) => Row(
                    children: [
                      SizedBox(width: 8.w),
                      _Button(
                        onTap: buttom['onTap'],
                        svgPath: buttom['imagePath'],
                      ),
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final String svgPath;
  final void Function() onTap;
  const _Button({Key? key, required this.svgPath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      width: 33.w,
      decoration: BoxDecoration(
        color: AppColors.pink,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: SvgPicture.asset(svgPath),
      ),
    );
  }
}
