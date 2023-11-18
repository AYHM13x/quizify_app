import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/cubits/settings_cubit/settings_cubit.dart';

class CustomDarkThemeSwitch extends StatefulWidget {
  const CustomDarkThemeSwitch({super.key});

  @override
  State<CustomDarkThemeSwitch> createState() => _CustomDarkThemeSwitchState();
}

class _CustomDarkThemeSwitchState extends State<CustomDarkThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Dark Theme"),
        Switch(
          value: BlocProvider.of<SettingsCubit>(context).getApptheme(),
          onChanged: (value) {
            BlocProvider.of<SettingsCubit>(context).changeAppTheme();
            setState(() {});
          },
        )
      ],
    );
  }
}
