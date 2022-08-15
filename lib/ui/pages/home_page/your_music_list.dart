import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapuha_music/domain/blocs/my_music_cubit.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourMusicList extends StatelessWidget {
  const YourMusicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MyMusicCubit>();
    final length = cubit.getLength();

    return Expanded(
      child: length != 0
          ? ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, index) => _ListItem(index: index),
              separatorBuilder: (_, index) => SizedBox(height: 1.h),
              itemCount: length,
            )
          : Center(
              child: Text(
                'Your music list is empty',
                style: FontStyles.styleBigText.copyWith(
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
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
    final cubit = context.read<MyMusicCubit>();

    return Container(
      padding:
          EdgeInsets.only(left: 16.w, top: 20.h, right: 54.w, bottom: 20.h),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          _ListItemImage(index: index, imagePath: cubit.getImagePath(index)),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ListItemTitle(songName: cubit.getSongName(index)),
                SizedBox(height: 7.h),
                _ListItemAlbum(album: cubit.getAlbum(index)),
                SizedBox(height: 15.h),
                _ListItemListening(listening: cubit.getListening(index)),
                SizedBox(height: 9.h),
                _ListItemButtons(index: index),
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
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;
  final int index;

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
              image: AssetImage(imagePath),
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
    required this.songName,
  }) : super(key: key);

  final String songName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          songName,
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
    required this.album,
  }) : super(key: key);

  final String album;

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
          album,
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
    required this.listening,
  }) : super(key: key);

  final int listening;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$listening listening',
      style: FontStyles.styleSmallText.copyWith(
        color: HexColor.fromHex('#484848'),
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _ListItemButtons extends StatelessWidget {
  final int index;
  const _ListItemButtons({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyMusicCubit>();
    var isFavourite = cubit.getisFavourite(index);
    var music = cubit.getMusic(index);

    return Row(
      children: [
        GestureDetector(
          onTap: () => isFavourite
              ? cubit.removeFromFavouriteMusic(music)
              : cubit.addToFavouriteMusic(music),
          child: SizedBox(
            height: 15.h,
            width: 15.w,
            child: SvgPicture.asset(
              isFavourite ? Svgs.favouriteFilled : Svgs.favourite,
            ),
          ),
        ),
        SizedBox(width: 15.w),
        GestureDetector(
          onTap: () => cubit.deleteFromMyMusic(index),
          child: Container(
            height: 15.h,
            width: 15.w,
            color: Colors.transparent,
            child: SvgPicture.asset(Svgs.remove),
          ),
        ),
      ],
    );
  }
}
