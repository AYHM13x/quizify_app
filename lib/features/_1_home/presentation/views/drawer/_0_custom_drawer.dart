import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/dimensions_of_screen.dart';
import 'package:quizify_app/core/utils/styles.dart';
import 'package:quizify_app/features/_1_home/presentation/model_view/cubits/settings_cubit/settings_cubit.dart';

import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/app_colors.dart';
import '_1_custom_switch.dart';
import '_3_custom_dropdown_button.dart';
import '_4_about_me_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
              CustomSwitch(
                  text: "Dark Theme",
                  value: BlocProvider.of<SettingsCubit>(context).getApptheme(),
                  onChange: (value) {
                    BlocProvider.of<SettingsCubit>(context).changeAppTheme();
                    setState(() {});
                  }),
              const Gap(4),
              const Divider(
                height: 5,
                color: AppColors.lightBlueColor,
              ),
              const Gap(4),
              CustomSwitch(
                  text: "Sounds",
                  value: BlocProvider.of<SettingsCubit>(context).getSoundApp(),
                  onChange: (value) {
                    BlocProvider.of<SettingsCubit>(context).switchSound();
                    setState(() {});
                  }),
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
              const AboutMeButton(),
            ],
          ),
        ),
      ],
    );
  }
}
