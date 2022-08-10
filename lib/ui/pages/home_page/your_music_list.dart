import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourMusicList extends StatelessWidget {
  const YourMusicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItems = <Map<String, dynamic>>[
      {
        'image': Images.img6,
        'songName': 'Lil Nas X, Nas - Rodeo',
        'album': '7 Ep',
        'listening': 6125
      },
      {
        'image': Images.img7,
        'songName': 'Lil Nas X, Nas - Rodeo',
        'album': '7 Ep',
        'listening': 6125
      },
      {
        'image': Images.img8,
        'songName': 'Lil Nas X, Nas - Rodeo',
        'album': '7 Ep',
        'listening': 6125
      },
      {
        'image': Images.img6,
        'songName': 'Lil Nas X, Nas - Rodeo',
        'album': '7 Ep',
        'listening': 6125
      },
      {
        'image': Images.img7,
        'songName': 'Lil Nas X, Nas - Rodeo',
        'album': '7 Ep',
        'listening': 6125
      },
      {
        'image': Images.img8,
        'songName': 'Lil Nas X, Nas - Rodeo',
        'album': '7 Ep',
        'listening': 6125
      },
    ];

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
    return Container(
      padding:
          EdgeInsets.only(left: 16.w, top: 20.h, right: 54.w, bottom: 20.h),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          _ListItemImage(index: index, item: item),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ListItemTitle(item: item),
                SizedBox(height: 7.h),
                _ListItemAlbum(item: item),
                SizedBox(height: 15.h),
                _ListItemListening(item: item),
                SizedBox(height: 9.h),
                const _ListItemButtons()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListItemImage extends StatelessWidget {
  const _ListItemImage({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${index + 1}.',
          style: FontStyles.style12.copyWith(color: Colors.black),
        ),
        SizedBox(width: 10.w),
        Container(
          height: 100.h,
          width: 85.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.h),
            image: DecorationImage(
              image: AssetImage(item['image']),
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
      ],
    );
  }
}

class _ListItemTitle extends StatelessWidget {
  const _ListItemTitle({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          item['songName'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: FontStyles.style14.copyWith(
            fontWeight: FontWeight.w400,
            color: HexColor.fromHex('#484848'),
          ),
        ),
        const Spacer(),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerRight,
            height: 10.h,
            width: 5.w,
            child: SvgPicture.asset(Svgs.dotsMenu),
          ),
        ),
      ],
    );
  }
}

class _ListItemAlbum extends StatelessWidget {
  const _ListItemAlbum({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Album',
          style: FontStyles.styleSmallText.copyWith(
            color: HexColor.fromHex('#A9A9A9'),
            fontSize: 9.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          item['album'],
          style: FontStyles.style12.copyWith(
            color: HexColor.fromHex('#A9A9A9'),
          ),
        ),
      ],
    );
  }
}

class _ListItemListening extends StatelessWidget {
  const _ListItemListening({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${item['listening']} listening',
      style: FontStyles.styleSmallText.copyWith(
        color: HexColor.fromHex('#484848'),
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _ListItemButtons extends StatelessWidget {
  const _ListItemButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 15.h,
            width: 15.w,
            child: SvgPicture.asset(Svgs.favourite),
          ),
        ),
        SizedBox(width: 15.w),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 15.h,
            width: 15.w,
            child: SvgPicture.asset(Svgs.remove),
          ),
        ),
      ],
    );
  }
}
