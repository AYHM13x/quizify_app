import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/styles.dart';
import '../widgets/the_final_result_score_view.dart';
import '../widgets/the_final_result_text_view.dart';

class TheFinalResultBody extends StatelessWidget {
  const TheFinalResultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(32),
        Text(
          "Final Result",
          style: Styles.textStyle50,
        ),
        TheFinalResultScoreView(),
        Gap(32),
        TheFinalResultTextView(),
      ],
    );
  }
}
