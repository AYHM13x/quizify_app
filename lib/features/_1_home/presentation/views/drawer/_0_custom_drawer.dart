import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/dimensions_of_screen.dart';
import 'package:quizify_app/core/utils/styles.dart';

import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/app_colors.dart';
import '_1_custom_dark_theme_switch.dart';
import '_2_custom_dropdown_button.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDarkThemeSwitch(),
              Gap(4),
              Divider(
                height: 5,
                color: AppColors.lightBlueColor,
              ),
              Gap(4),
              Text(
                "Difficulty:",
                style: Styles.textStyle18,
              ),
              Gap(4),
              CustomDropdownButton(),
              Gap(4),
              Divider(
                height: 5,
                color: AppColors.lightBlueColor,
              ),
              Gap(4),
            ],
          ),
        ),
      ],
    );
  }
}
