import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/domain/blocs/setting_cubit.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();

    return Expanded(
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) => _ListItem(index: index),
            itemCount: cubit.getLength(),
            separatorBuilder: (_, int index) => SizedBox(height: 1.h),
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) => _ListItem(index: index),
            itemCount: cubit.getLength(),
            separatorBuilder: (_, int index) => SizedBox(height: 1.h),
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) => _ListItem(index: index),
            itemCount: cubit.getLength(),
            separatorBuilder: (_, int index) => SizedBox(height: 1.h),
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final int index;

  const _ListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding:
            EdgeInsets.only(left: 16.w, top: 10.h, right: 16.w, bottom: 10.h),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.h),
                color: AppColors.pink,
              ),
              child: SvgPicture.asset(
                cubit.getImagePath(index),
                fit: BoxFit.fitHeight,
                width: 15.w,
                height: 15.h,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              cubit.getSettingTitle(index),
              style: FontStyles.style14.copyWith(color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(),
            SizedBox(width: 10.w),
            Container(
              alignment: Alignment.centerRight,
              height: 15.h,
              width: 10.w,
              child: SvgPicture.asset(Svgs.arrowRight),
            )
          ],
        ),
      ),
    );
  }
}
