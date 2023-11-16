import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/cubits/setting_provider/model_theme.dart';

class QuizViewAppBar extends StatelessWidget {
  const QuizViewAppBar({super.key, this.text});
  final String? text;
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
          Text(
            text ?? "",
            style: Styles.textStyle30,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              themeNotifier.isDark
                  ? themeNotifier.isDark = false
                  : themeNotifier.isDark = true;
            },
            icon: Icon(themeNotifier.isDark ? Icons.nightlight : Icons.sunny),
            iconSize: 34,
          )
        ],
      );
    });
  }
}
