import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class QuestionTextSection extends StatelessWidget {
  const QuestionTextSection({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.whiteColor),
      ),
      child: Text(
        text,
        style: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
