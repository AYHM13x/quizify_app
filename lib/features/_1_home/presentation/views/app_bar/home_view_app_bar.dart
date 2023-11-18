import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/core/utils/cubits/settings_cubit/settings_cubit.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';

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
        IconButton(
          onPressed: () {
            BlocProvider.of<SettingsCubit>(context).changeAppTheme();
            setState(() {});
          },
          icon: Icon(BlocProvider.of<SettingsCubit>(context).getApptheme()
              ? Icons.sunny
              : Icons.nightlight),
          iconSize: 34,
        )
      ],
    );
  }
}
