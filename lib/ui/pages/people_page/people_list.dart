import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';

class PeopleList extends StatelessWidget {
  PeopleList({
    Key? key,
  }) : super(key: key);

  final listItems = <Map<String, dynamic>>[
    {
      'avatar': Images.avatar,
      'userName': 'User name',
      'onTap': () {},
    },
    {
      'avatar': Images.avatar,
      'userName': 'User name 2',
      'onTap': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) =>
            _ListItem(index: index, item: listItems[index]),
        separatorBuilder: (_, index) => SizedBox(height: 1.h),
        itemCount: listItems.length,
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final int index;
  final Map<String, dynamic> item;

  const _ListItem({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item['onTap'],
      child: Container(
        padding:
            EdgeInsets.only(left: 16.w, top: 10.h, right: 16.w, bottom: 10.h),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            _Avatar(avatar: item['avatar']),
            SizedBox(width: 8.w),
            Text(
              item['userName'],
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
