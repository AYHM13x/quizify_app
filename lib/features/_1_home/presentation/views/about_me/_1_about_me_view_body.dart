import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/styles.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../../../../core/utils/functions/url_launcher_functions.dart';
import '_3_about_me_card_view.dart';

class AboutMeViewBody extends StatelessWidget {
  const AboutMeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contact Me",
          style: Styles.textStyle20,
        ),
        const Gap(32),
        const Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Text(
            "Ayhm Al-Akel",
            style: TextStyle(
                fontSize: 35.0, color: Colors.white, fontFamily: "ComicSans"),
          ),
        ),
        const Text(
          "system administrator",
          style: TextStyle(
            color: Colors.white54,
            fontSize: 18.0,
          ),
        ),
        const Divider(
          thickness: 2.0,
          color: Colors.white54,
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
    );
  }
}
