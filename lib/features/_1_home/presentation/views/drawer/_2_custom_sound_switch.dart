import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_view/cubits/settings_cubit/settings_cubit.dart';

class CustomSoundSwitch extends StatefulWidget {
  const CustomSoundSwitch({super.key});

  @override
  State<CustomSoundSwitch> createState() => _CustomSoundSwitchState();
}

class _CustomSoundSwitchState extends State<CustomSoundSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Sounds"),
        Switch(
          value: BlocProvider.of<SettingsCubit>(context).getSoundApp(),
          onChanged: (value) {
            BlocProvider.of<SettingsCubit>(context).switchSound();
            setState(() {});
          },
        )
      ],
    );
  }
}
