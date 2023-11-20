import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/custom_widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/utils/functions/quiz_functions.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';
import '../widgets/_0_question_item_view.dart';
import '../widgets/_3_score_view.dart';

class QuizViewBodyUnFinished extends StatefulWidget {
  const QuizViewBodyUnFinished({
    super.key,
  });

  @override
  State<QuizViewBodyUnFinished> createState() => _QuizViewBodyUnFinishedState();
}

class _QuizViewBodyUnFinishedState extends State<QuizViewBodyUnFinished> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionItemView(
          question:
              BlocProvider.of<AllQuestionsCubit>(context).getCurrentQuestion(),
        ),
        const Divider(
          height: 8,
          thickness: 5,
          color: AppColors.greyColor,
        ),
        BlocListener<AllQuestionsCubit, AllQuestionsState>(
          listener: (context, state) {
            if (state is AllQuestionsUserAnswered ||
                state is AllQuestionsUserSubmit) {
              setState(() {});
            }
          },
          child: Column(
            children: [
              ScoreView(
                correctAnswer: BlocProvider.of<AllQuestionsCubit>(context)
                    .getCorrectAnswersResult(),
                wrongAnswer: BlocProvider.of<AllQuestionsCubit>(context)
                    .getWorngAnswersResult(),
              ),
              Gap(DimensionsOfScreen.dimensionsOfHeight(context, 5)),
              CutsomButton(
                text: "Confirm",
                isPressable: BlocProvider.of<AllQuestionsCubit>(context)
                    .isSubmitButtonAvaliable(),
                onPressed: () {
                  submitAnswer(context);
                  setState(() {});
                },
              ),
              CutsomButton(
                text: "Next Question",
                isPressable: BlocProvider.of<AllQuestionsCubit>(context)
                    .isAvaliableToGoToNextQuestion(),
                onPressed: () {
                  goToNextQuestion(context);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
