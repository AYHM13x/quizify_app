import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.whiteColor),
        color: AppColors.greyColor,
      ),
      child: Text(
        "Question Text?",
        style: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
