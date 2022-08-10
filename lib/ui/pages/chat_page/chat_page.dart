import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBg,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
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
              padding: EdgeInsets.only(
                  left: 16.w, top: 40.h, right: 16.w, bottom: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 15.h,
                      width: 30.w,
                      child: SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child: SvgPicture.asset(Svgs.arrowLeft, color: Colors.white)),
                    ),
                  ),
                  Text(
                    'User name',
                    style: FontStyles.style18.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(Images.avatar)),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomTextField(),
          ),
        ],
      ),
    );
  }
}

class _BottomTextField extends StatelessWidget {
  const _BottomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: HexColor.fromHex('#A9A9A9'), width: 1.h),
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: TextField(
                minLines: 1,
                maxLines: 7,
                showCursor: false,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: HexColor.fromHex('#A9A9A9')),
                  hintText: 'Message',
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
              color: AppColors.pink,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 16.h,
                )),
          ),
        ],
      ),
    );
  }
}
