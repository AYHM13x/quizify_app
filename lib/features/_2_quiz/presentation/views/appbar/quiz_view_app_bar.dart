import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';

class QuizViewAppBar extends StatelessWidget {
  const QuizViewAppBar({super.key});

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
          icon: const Icon(Icons.dark_mode),
          iconSize: 34,
        )
      ],
    );
  }
}
