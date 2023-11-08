import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import 'answer_section.dart';
import 'qustion_section.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionSection(
          text: text,
        ),
        const Gap(8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("id quetion"),
            Text("diffculty"),
          ],
        ),
        const Divider(
          height: 8,
          thickness: 5,
          color: AppColors.greyColor,
        ),
        const Gap(8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AswerSection(),
        ),
      ],
    );
  }
}
