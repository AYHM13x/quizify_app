import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/app_colors.dart';
import 'package:quizify_app/features/_1_home/presentation/model_view/cubits/settings_cubit/settings_cubit.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../../../../core/utils/functions/url_launcher_functions.dart';
import '_2_about_me_view_app_bar.dart';
import '_3_about_me_card_view.dart';

class AboutMeViewBody extends StatefulWidget {
  const AboutMeViewBody({super.key});

  @override
  State<AboutMeViewBody> createState() => _AboutMeViewBodyState();
}

class _AboutMeViewBodyState extends State<AboutMeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsDarkAppTheme || state is SettingsLightAppTheme) {
          setState(() {});
        }
      },
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AboutMeViewAppBar(),
          ),
          const Gap(64),
          const Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(
              "Ayhm Al-Akel",
              style: TextStyle(fontSize: 35.0, fontFamily: "ComicSans"),
            ),
          ),
          Text(
            "system administrator",
            style: TextStyle(
              fontSize: 18.0,
              color: BlocProvider.of<SettingsCubit>(context).getApptheme()
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
          Divider(
            thickness: 2.0,
            color: BlocProvider.of<SettingsCubit>(context).getApptheme()
                ? AppColors.whiteColor
                : AppColors.blackColor,
            indent: 70.0,
            endIndent: 70.0,
            height: 20.0,
          ),
          AboutMeCardView(
            text: "(+963)-993-757-674",
            icon: const Icon(
              Icons.call,
              size: 35.0,
              color: Color(0xFF2C5BAB),
            ),
            onTap: () async {
              callMe("(+963)-993-757-674");
            },
          ),
          AboutMeCardView(
            text: "AyhmAlAkel1995@gmail.com",
            icon: const Icon(
              Icons.mail,
              size: 35.0,
              color: Color(0xFF2C5BAB),
            ),
            onTap: () async {
              sendEmail("AyhmAlAkel1995@gmail.com");
            },
          ),
          AboutMeCardView(
            text: "T.me/ayhm13x",
            icon: const Icon(
              Icons.telegram,
              size: 35.0,
              color: Color(0xFF2C5BAB),
            ),
            onTap: () async {
              customLaunchUrl("https://T.me/ayhm13x");
            },
          ),
          AboutMeCardView(
            text: "fb.com/Ayhm.Al-Akel",
            icon: const Icon(
              Icons.facebook,
              size: 35.0,
              color: Color(0xFF2C5BAB),
            ),
            onTap: () async {
              customLaunchUrl("https://fb.com/Ayhm.Al-Akel");
            },
          ),
          AboutMeCardView(
            text: "GitHub.com/Ayhm13x",
            icon: const Icon(
              SimpleIcons.github,
              size: 30.0,
              color: Color(0xFF2C5BAB),
            ),
            onTap: () async {
              customLaunchUrl("https://GitHub.com/Ayhm13x");
            },
          ),
        ],
      ),
    );
  }
}
