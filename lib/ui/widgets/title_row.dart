import 'package:flutter/material.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';

class TitleRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function() onTap;
  final bool spacer;

  const TitleRow({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
    required this.spacer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            firstText,
            style: FontStyles.style18.copyWith(color: Colors.black),
          ),
          SizedBox(width: 6.w),
          spacer == true ? const Spacer() : const SizedBox.shrink(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              secondText,
              style: FontStyles.style18.copyWith(
                color: AppColors.pink,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
