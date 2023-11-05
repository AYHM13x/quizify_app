import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/app_colors.dart';
import 'package:quizify_app/features/_2_quiz/presentation/views/widgets/question_view.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../appbar/quiz_view_app_bar.dart';

import '../../../../../core/custom_widgets/custom_button.dart';
import '../widgets/score_view.dart';

class QuizViewbody extends StatelessWidget {
  const QuizViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: QuizViewAppBar(),
        ),
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 86),
            child: const CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      QuestionView(),
                      Divider(
                        height: 8,
                        thickness: 5,
                        color: AppColors.greyColor,
                      ),
                      ScoreView(),
                      Gap(16),
                      CutsomButton(
                        text: "Confirm",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
