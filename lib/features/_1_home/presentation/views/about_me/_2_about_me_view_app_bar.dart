import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_view/cubits/settings_cubit/settings_cubit.dart';

class AboutMeViewAppBar extends StatefulWidget {
  const AboutMeViewAppBar({super.key});

  @override
  State<AboutMeViewAppBar> createState() => _AboutMeViewAppBarState();
}

class _AboutMeViewAppBarState extends State<AboutMeViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          kAppName,
          style: Styles.textStyle30.copyWith(
            fontFamily: FontFamilies.dancingScript,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Contact Me",
          style: Styles.textStyle30,
        ),
        BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is SettingsDarkAppTheme ||
                state is SettingsLightAppTheme) {
              setState(() {});
            }
          },
          child: IconButton(
            onPressed: () {
              BlocProvider.of<SettingsCubit>(context).changeAppTheme();
              setState(() {});
            },
            icon: Icon(BlocProvider.of<SettingsCubit>(context).getApptheme()
                ? Icons.sunny
                : Icons.nightlight),
            iconSize: 34,
          ),
        ),
      ],
    );
  }
}
