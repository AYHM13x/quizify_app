import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/custom_widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../data/question_model/question_model.dart';
import '../appbar/quiz_view_app_bar.dart';
import '../widgets/question_view.dart';
import '../widgets/score_view.dart';

class QuizViewbody extends StatefulWidget {
  const QuizViewbody({
    super.key,
    required this.questions,
  });
  final List<QuestionModel> questions;

  @override
  State<QuizViewbody> createState() => _QuizViewbodyState();
}

class _QuizViewbodyState extends State<QuizViewbody> {
  int currentQuestion = 0;
  int correctAnswer = 0, worngAsnwer = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: QuizViewAppBar(
            text: "Linux Quiz",
          ),
        ),
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 86),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      QuestionView(
                        question: widget.questions[currentQuestion],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 5,
                        color: AppColors.greyColor,
                      ),
                      ScoreView(
                        correctAnswer: correctAnswer,
                        wrongAnswer: worngAsnwer,
                      ),
                      const Gap(16),
                      const CutsomButton(
                        text: "Confirm",
                      ),
                      const CutsomButton(
                        text: "Next Question",
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
