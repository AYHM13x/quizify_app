import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/features/_2_quiz/presentation/model_view/cubit/all_questions_cubit.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocListener<AllQuestionsCubit, AllQuestionsState>(
      listener: (context, state) {
        if (state is AllQuestionsUserAnswered) {
          setState(() {});
        }
        if (state is AllQuestionsUserSubmit) {
          setState(() {});
        }
      },
      child: Column(
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
                          question: widget.questions[
                              BlocProvider.of<AllQuestionsCubit>(context)
                                  .currentQuestion],
                        ),
                        const Divider(
                          height: 8,
                          thickness: 5,
                          color: AppColors.greyColor,
                        ),
                        ScoreView(
                          correctAnswer:
                              BlocProvider.of<AllQuestionsCubit>(context)
                                  .correctAnswer,
                          wrongAnswer:
                              BlocProvider.of<AllQuestionsCubit>(context)
                                  .worngAnswer,
                        ),
                        const Gap(16),
                        CutsomButton(
                          text: "Confirm",
                          isPressable:
                              BlocProvider.of<AllQuestionsCubit>(context)
                                          .choosedAnswerIndex ==
                                      -1
                                  ? false
                                  : true,
                          onPressed: () {
                            submitAnswer(context);
                            setState(() {});
                          },
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
      ),
    );
  }

  void submitAnswer(BuildContext context) {
    if (BlocProvider.of<AllQuestionsCubit>(context).isUserChooseAnswer) {
      BlocProvider.of<AllQuestionsCubit>(context).updateScore();
    }
  }
}
