import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/_2_quiz/presentation/model_view/all_questions_cubit/all_questions_cubit.dart';

void goToNextQuestion(BuildContext context) {
  BlocProvider.of<AllQuestionsCubit>(context).goToNextQuestion();
}

void submitAnswer(BuildContext context) {
  BlocProvider.of<AllQuestionsCubit>(context).updateScore();
}

String getTheFinalResultTextView(bool isPassed) {
  if (isPassed) {
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
