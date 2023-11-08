import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';

class HomeViewAppBar extends StatefulWidget {
  const HomeViewAppBar({super.key});

  @override
  State<HomeViewAppBar> createState() => _HomeViewAppBarState();
}

class _HomeViewAppBarState extends State<HomeViewAppBar> {
  bool isDarkmode = true;

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
          onPressed: () {},
          icon: Icon(!isDarkmode ? Icons.dark_mode : Icons.sunny),
          iconSize: 34,
        )
      ],
    );
  }
}
