import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/theme_provider.dart';

class HomeViewAppBar extends StatefulWidget {
  const HomeViewAppBar({super.key});

  @override
  State<HomeViewAppBar> createState() => _HomeViewAppBarState();
}

class _HomeViewAppBarState extends State<HomeViewAppBar> {
  bool isDarkmode = false;

  @override
  Widget build(BuildContext context) {
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
            final themeProvider = Provider.of<ThemeProvider>(context,
                listen:
                    false); // get the provider, listen false is necessary cause is in a function

            setState(() {
              isDarkmode = !isDarkmode;
            }); // change the variable

            isDarkmode // call the functions
                ? themeProvider.setDarkmode()
                : themeProvider.setLightMode();
          },
          icon: Icon(!isDarkmode ? Icons.dark_mode : Icons.sunny),
          iconSize: 34,
        )
      ],
    );
  }
}
