import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';
import '../../model_view/cubits/settings_cubit/settings_cubit.dart';

class HomeViewAppBar extends StatefulWidget {
  const HomeViewAppBar({super.key});

  @override
  State<HomeViewAppBar> createState() => _HomeViewAppBarState();
}

class _HomeViewAppBarState extends State<HomeViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.list)),
        Text(
          kAppName,
          style: Styles.textStyle30.copyWith(
            fontFamily: FontFamilies.dancingScript,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
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
        )
      ],
    );
  }
}
