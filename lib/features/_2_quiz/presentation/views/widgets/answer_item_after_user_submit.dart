import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';
import 'package:quizify_app/features/_2_quiz/presentation/model_view/cubit/all_questions_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class AswerItemAfterUserSubmit extends StatelessWidget {
  const AswerItemAfterUserSubmit({
    super.key,
    required this.id,
    this.isSelected = false,
    required this.question,
  });

  final int id;
  final QuestionModel question;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (question.answers!.answerList[id] != kThereIsNoAnswer) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                side: BorderSide(
                  color:
                      isSelected ? AppColors.orangeColor : AppColors.whiteColor,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              getColorAfterSubmit(context),
            ),
          ),
          child: Container(
            height: 65,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            child: Text(
              "$id - ${question.answers!.answerList[id]}",
              style: Styles.textStyle16.copyWith(
                color: isSelected ? AppColors.blackColor : AppColors.whiteColor,
              ),
            ),
          ),
        ),
      );
    } else {
      return const Center();
    }
  }

  Color getColorAfterSubmit(BuildContext context) {
    int choosedAnswerIndex =
        BlocProvider.of<AllQuestionsCubit>(context).getChoosedAnswerIndex();
    if (question.correctAnswers!.correctAnswerList[id] == "true") {
      return AppColors.greenColor;
    } else {
      if (question.correctAnswers!.correctAnswerList[choosedAnswerIndex] ==
          "false") {
        return AppColors.redColor;
      } else {
        return AppColors.blackColor;
      }
    }
  }
}
