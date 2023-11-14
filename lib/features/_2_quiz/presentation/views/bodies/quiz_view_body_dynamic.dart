import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/custom_widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/question_model/question_model.dart';
import '../../model_view/cubit/all_questions_cubit.dart';
import '../widgets/question_item_view.dart';
import '../widgets/score_view.dart';

class QuizViewBodyDynamic extends StatefulWidget {
  const QuizViewBodyDynamic({super.key, required this.questions});
  final List<QuestionModel> questions;
  @override
  State<QuizViewBodyDynamic> createState() => _QuizViewBodyDynamicState();
}

class _QuizViewBodyDynamicState extends State<QuizViewBodyDynamic> {
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<AllQuestionsCubit>(context).getCurrentQuestionIndex() <
        widget.questions.length) {
      return Column(
        children: [
          QuestionItemView(
            question: widget.questions[
                BlocProvider.of<AllQuestionsCubit>(context)
                    .getCurrentQuestionIndex()],
          ),
          const Divider(
            height: 8,
            thickness: 5,
            color: AppColors.greyColor,
          ),
          ScoreView(
            correctAnswer:
                BlocProvider.of<AllQuestionsCubit>(context).correctAnswer,
            wrongAnswer:
                BlocProvider.of<AllQuestionsCubit>(context).worngAnswer,
          ),
          const Gap(16),
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
      );
    } else {
      return const SizedBox();
    }
  }

  void goToNextQuestion(BuildContext context) {
    BlocProvider.of<AllQuestionsCubit>(context).goToNextQuestion();
  }

  void submitAnswer(BuildContext context) {
    BlocProvider.of<AllQuestionsCubit>(context).updateScore();
  }
}
