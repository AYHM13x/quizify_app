import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Correct Answers: 0",
          style: Styles.textStyle18.copyWith(
            color: AppColors.greenColor,
          ),
        ),
        Text(
          "Wrong Answers: 0",
          style: Styles.textStyle18.copyWith(
            color: AppColors.redColor,
          ),
        ),
      ],
    );
  }
}
