import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kapuha_music/domain/blocs/favourite_music_cubit.dart';
import 'package:kapuha_music/domain/blocs/my_music_cubit.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/pages/home_page/favourite_music_list.dart';
import 'package:kapuha_music/ui/pages/home_page/your_music_list.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:kapuha_music/ui/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final listHeaderButtons = <Map<String, dynamic>>[
      {
        'imagePath': Svgs.addContact,
        'onTap': () {},
      },
      {
        'imagePath': Svgs.chat,
        'onTap': () {},
      },
    ];

    final listCategories = <Map<String, dynamic>>[
      {
        'categoryName': 'Your music',
      },
      {
        'categoryName': 'Favourite',
      },
    ];

    final listMusicLists = [
      BlocProvider(
        create: (_) => MyMusicCubit(),
        child: const YourMusicList(),
      ),
      BlocProvider(
        create: (_) => FavouriteMusicCubit(),
        child: const FavouriteMusicList(),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.lightGreyBg,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 140.h),
              SizedBox(
                height: 20.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Text(
                      listCategories[index]['categoryName'],
                      style: FontStyles.style18.copyWith(
                          color: _currentIndex == index
                              ? Colors.black
                              : Colors.grey),
                    ),
                  ),
                  itemCount: 2,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 15.w),
                ),
              ),
              SizedBox(height: 20.h),
              listMusicLists[_currentIndex],
            ],
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Header(
              listButtons: listHeaderButtons,
            ),
          ),
        ],
      ),
    );
  }
}
