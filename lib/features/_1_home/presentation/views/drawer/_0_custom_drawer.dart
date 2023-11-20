import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quizify_app/core/utils/app_routrer.dart';
import 'package:quizify_app/core/utils/dimensions_of_screen.dart';
import 'package:quizify_app/core/utils/styles.dart';
import 'package:quizify_app/features/_1_home/presentation/views/drawer/_2_custom_sound_switch.dart';

import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/app_colors.dart';
import '_1_custom_dark_theme_switch.dart';
import '_3_custom_dropdown_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          padding: const EdgeInsets.all(40),
          height: DimensionsOfScreen.dimensionsOfHeight(context, 35),
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(
                color: AppColors.lightBlueColor,
                width: 5,
              ),
            ),
            color: Colors.blueAccent.withOpacity(.3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //const Gap(44),
              SizedBox(
                height: 100,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(AssetsImage.appLogo),
                ),
              ),
              const Gap(16),
              Text(
                "Quizify App",
                style: Styles.textStyle30.copyWith(
                  fontFamily: FontFamilies.dancingScript,
                ),
              ),
            ],
          ),
        ),
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDarkThemeSwitch(),
              const Gap(4),
              const Divider(
                height: 5,
                color: AppColors.lightBlueColor,
              ),
              const Gap(4),
              const CustomSoundSwitch(),
              const Gap(4),
              const Divider(
                height: 5,
                color: AppColors.lightBlueColor,
              ),
              const Gap(4),
              const Text(
                "Difficulty:",
                style: Styles.textStyle18,
              ),
              const Gap(4),
              const CustomDropdownButton(),
              const Gap(4),
              const Divider(
                height: 5,
                color: AppColors.lightBlueColor,
              ),
              const Gap(16),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.aboutMeViewPath);
                },
                child: const Text(
                  "About Me",
                  style: Styles.textStyle18,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
