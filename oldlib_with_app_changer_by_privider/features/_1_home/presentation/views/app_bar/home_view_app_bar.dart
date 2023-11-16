import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/cubits/setting_provider/model_theme.dart';

class HomeViewAppBar extends StatefulWidget {
  const HomeViewAppBar({super.key});

  @override
  State<HomeViewAppBar> createState() => _HomeViewAppBarState();
}

class _HomeViewAppBarState extends State<HomeViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Row(
        children: [
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
              themeNotifier.isDark
                  ? themeNotifier.isDark = false
                  : themeNotifier.isDark = true;
            },
            icon: Icon(themeNotifier.isDark ? Icons.sunny : Icons.nightlight),
            iconSize: 34,
          )
        ],
      );
    });
  }
}
