import 'package:flutter/material.dart';
import 'package:quizify_app/core/utils/dimensions_of_screen.dart';

import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
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
            children: [
              SizedBox(
                height: 100,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(AssetsImage.appLogo),
                ),
              ),
              const Text("data"),
            ],
          ),
        )
      ],
    );
  }
}
