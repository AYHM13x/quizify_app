import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class QuestionTextLoadingView extends StatelessWidget {
  const QuestionTextLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.maxFinite,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.greyColor),
          color: AppColors.greyColor),
    );
  }
}
