import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';

class ChatsList extends StatelessWidget {
  ChatsList({
    Key? key,
  }) : super(key: key);

  final listItems = <Map<String, dynamic>>[
    {
      'avatar': Images.avatar,
      'userName': 'User name 1',
      'text':
          'sfjkd sdlkf sk sl; ksnnv l;sdf rlk  v;l;s n srlkkmf ksdflksdfan askfmglksnrknwnej  cksdkf;sekfjlkejl s ldsdfnjdejesfn sdlkvksn',
      'date': 'Wed',
      'messageCount': 3,
      'onTap': () {},
    },
    {
      'avatar': Images.avatar,
      'userName': 'User name 2',
      'text':
          'sfjkd sdlkf sk sl; ksnnv l;sdf rlk  v;l;s n srlkkmf ksdflksdfan askfmglksnrknwnej  cksdkf;sekfjlkejl s ldsdfnjdejesfn sdlkvksn',
      'date': 'Wed',
      'messageCount': 34,
      'onTap': () {},
    },
    {
      'avatar': Images.avatar,
      'userName': 'User name 3',
      'text':
          'sfjkd sdlkf sk sl; ksnnv l;sdf rlk  v;l;s n srlkkmf ksdflksdfan askfmglksnrknwnej  cksdkf;sekfjlkejl s ldsdfnjdejesfn sdlkvksn',
      'date': 'Wed',
      'messageCount': 0,
      'onTap': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (_, index) =>
          _ListItem(index: index, item: listItems[index]),
      separatorBuilder: (_, index) => SizedBox(height: 1.h),
      itemCount: listItems.length,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Avatar(avatar: item['avatar']),
            SizedBox(width: 8.w),
            _FirstChatInfo(
              userName: item['userName'],
              text: item['text'],
            ),
            SizedBox(width: 8.w),
            _DateAndMessageCount(
              date: item['date'],
              count: item['messageCount'],
            ),
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
      height: 40.h,
      width: 40.w,
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

class _FirstChatInfo extends StatelessWidget {
  final String userName;
  final String text;
  const _FirstChatInfo({
    Key? key,
    required this.userName,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: FontStyles.style14
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(height: 5.h),
          Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                FontStyles.style12.copyWith(color: HexColor.fromHex('#5E5E5E')),
          ),
        ],
      ),
    );
  }
}

class _DateAndMessageCount extends StatelessWidget {
  final String date;
  final int count;
  const _DateAndMessageCount({
    Key? key,
    required this.date,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          date,
          style: FontStyles.style14
              .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        SizedBox(height: 5.h),
        count != 0
            ? Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.h),
                  color: AppColors.pink,
                ),
                child: Text(
                  count.toString(),
                  style: FontStyles.styleSmallText
                      .copyWith(fontSize: 10, color: Colors.white),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
