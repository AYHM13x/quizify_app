import 'package:flutter/material.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/functions/quiz_functions.dart';
import '../../../../../core/utils/styles.dart';

class AswerItemAfterUserSubmit extends StatelessWidget {
  const AswerItemAfterUserSubmit({
    super.key,
    required this.id,
    this.isSelected = false,
    required this.question,
    required this.answerText,
  });

  final int id;
  final String answerText;
  final QuestionModel question;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (answerText != kThereIsNoAnswer) {
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
              getColorAfterSubmit(context, id,
                  question.correctAnswers!.correctAnswerList[id] ?? "false"),
            ),
          ),
          child: Container(
            height: 65,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            child: Text(
              "${id + 1} - ${question.answers!.answerList[id]}",
              style: Styles.textStyle16.copyWith(
                color: getColorText(isSelected,
                        question.correctAnswers!.correctAnswerList[id]!)
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
              ),
            ),
          ),
        ),
      );
    } else {
      return const Center();
    }
  }

  bool getColorText(bool isSelected, String isCorrect) {
    if ((isSelected && isCorrect == "false") || isCorrect == "true") {
      return true;
    } else {
      return false;
    }
  }
}
