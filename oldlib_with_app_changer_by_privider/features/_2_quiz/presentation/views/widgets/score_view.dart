import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({
    super.key,
    required this.correctAnswer,
    required this.wrongAnswer,
  });

  final int correctAnswer, wrongAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Correct Answers: $correctAnswer",
          style: Styles.textStyle18.copyWith(
            color: AppColors.greenColor,
          ),
        ),
        Text(
          "Wrong Answers: $wrongAnswer",
          style: Styles.textStyle18.copyWith(
            color: AppColors.redColor,
          ),
        ),
      ],
    );
  }
}
