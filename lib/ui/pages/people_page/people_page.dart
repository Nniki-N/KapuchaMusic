import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapuha_music/domain/blocs/people_cubit.dart';
import 'package:kapuha_music/resources/resources.dart';
import 'package:kapuha_music/ui/pages/people_page/people_list.dart';
import 'package:kapuha_music/ui/utils/app_colors.dart';
import 'package:kapuha_music/ui/utils/font_styles.dart';
import 'package:kapuha_music/ui/widgets/header.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listHeaderButtons = <Map<String, dynamic>>[
      {
        'imagePath': Svgs.chat,
        'onTap': () {},
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.lightGreyBg,
      body: Stack(
        children: [
          BlocProvider(
            create: (_) => PeopleCubit(),
            child: const PeopleList(),
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
