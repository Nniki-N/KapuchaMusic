import 'package:flutter/material.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontStyles {
  static final styleSmallText = TextStyle(
    fontSize: 14.sp,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w300,
  );

  static final styleBigText = TextStyle(
    fontSize: 18.sp,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w300,
  );

  static final style12 = TextStyle(
    fontSize: 12.sp,
    color: HexColor.fromHex('#A9A9A9'),
    fontWeight: FontWeight.w300,
  );

  static final style14 = TextStyle(
    fontSize: 14.sp,
    color: HexColor.fromHex('#484848'),
    fontWeight: FontWeight.w300,
  );

  static final style16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
  );

  static final style18 = TextStyle(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );
}
