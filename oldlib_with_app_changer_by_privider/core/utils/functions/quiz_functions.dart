import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/_2_quiz/presentation/model_view/all_questions_cubit/all_questions_cubit.dart';
import '../app_colors.dart';

void goToNextQuestion(BuildContext context) {
  BlocProvider.of<AllQuestionsCubit>(context).goToNextQuestion();
}

void submitAnswer(BuildContext context) {
  BlocProvider.of<AllQuestionsCubit>(context).updateScore();
}

Color getColorAfterSubmit(
    BuildContext context, int id, String currentChoosedAnwser) {
  int choosedAnswerIndex =
      BlocProvider.of<AllQuestionsCubit>(context).getChoosedAnswerIndex();
  if (currentChoosedAnwser == "true") {
    return AppColors.greenColor;
  } else {
    if (id == choosedAnswerIndex) {
      return AppColors.redColor;
    } else {
      return AppColors.blackColor;
    }
  }
}

Color getColorDifficulty(String text) {
  if (text == "Easy") {
    return AppColors.greenColor;
  } else if (text == "Medium") {
    return AppColors.orangeColor;
  } else {
    return AppColors.redColor;
  }
}

String getTheFinalResultTextView(BuildContext context) {
  if (BlocProvider.of<AllQuestionsCubit>(context).getTheFinalResult() > 60.0) {
    return "Congratulation, you are PASSED in the quiz ✅";
  } else {
    return "Ohh No, you are FAILED in the quiz ❌";
  }
}

double getNumberOfAvailbleAnswers(List<String?> list) {
  double x = 1;
  String text = "";
  for (var i = 0; i < list.length; i++) {
    text = list[i] ?? "";
    if (text != "") {
      x++;
    }
  }
  return x;
}
