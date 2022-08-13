import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/domain/blocs/top_music_cubit.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:kapuha_music/ui/widgets/title_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMusicView extends StatelessWidget {
  const TopMusicView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TopMusicCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20.h),
        TitleRow(
          firstText: 'top-5 music',
          secondText: 'ever',
          onTap: () {},
          spacer: false,
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          height: 213.h,
          color: Colors.white,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _ListItem(
              index: index,
            ),
            separatorBuilder: (_, index) => SizedBox(width: 8.w),
            itemCount: cubit.getLength(),
          ),
        )
      ],
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
    final cubit = context.read<TopMusicCubit>();

    return Column(
      children: [
        Container(
          height: 120.h,
          width: 104.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.h),
            image: DecorationImage(
              image: AssetImage(cubit.getImagePath(index)),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                Svgs.play,
                height: 40.h,
                width: 40.w,
              ),
            ),
          ),
        ),
        Container(
          width: 104.w,
          margin: EdgeInsets.only(top: 11.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}.',
                style: FontStyles.style12.copyWith(
                  color: HexColor.fromHex('#5E5E5E'),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  cubit.getText(index),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.style12.copyWith(
                    color: HexColor.fromHex('#5E5E5E'),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
