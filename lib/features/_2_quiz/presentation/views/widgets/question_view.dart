import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import 'answer_section.dart';
import 'qustion_section.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuestionSection(),
        Gap(8),
        Divider(
          height: 8,
          thickness: 5,
          color: AppColors.greyColor,
        ),
        Gap(8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AswerSection(),
        ),
      ],
    );
  }
}
