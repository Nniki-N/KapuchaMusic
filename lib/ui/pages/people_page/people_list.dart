import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/domain/blocs/people_cubit.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PeopleCubit>();
    final length = cubit.getLength();

    return Column(
      children: [
        SizedBox(height: 140.h),
        const _TextField(),
        SizedBox(height: 20.h),
        Expanded(
          child: length != 0
              ? ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) => _ListItem(index: index),
                  separatorBuilder: (_, index) => SizedBox(height: 1.h),
                  itemCount: length,
                )
              : Center(
                  child: Text(
                    'Input exist name in field',
                    style: FontStyles.styleBigText.copyWith(
                      fontSize: 22,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PeopleCubit>();

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
                Expanded(
                  child: TextField(
                    onChanged: cubit.searchPeople,
                    showCursor: false,
                    decoration: const InputDecoration(
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

class _ListItem extends StatelessWidget {
  final int index;

  const _ListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PeopleCubit>();

    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding:
            EdgeInsets.only(left: 16.w, top: 10.h, right: 16.w, bottom: 10.h),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            _Avatar(avatar: cubit.getAvatarPath(index)),
            SizedBox(width: 8.w),
            Text(
              cubit.getUserName(index),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: FontStyles.style14.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            SizedBox(width: 16.w),
            GestureDetector(child: SvgPicture.asset(Svgs.add))
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String avatar;
  const _Avatar({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(avatar),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
