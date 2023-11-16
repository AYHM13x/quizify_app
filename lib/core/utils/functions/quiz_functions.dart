import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/_2_quiz/presentation/model_view/all_questions_cubit/all_questions_cubit.dart';
import '../app_colors.dart';
import '../cubits/settings_cubit/settings_cubit.dart';

void goToNextQuestion(BuildContext context) {
  BlocProvider.of<AllQuestionsCubit>(context).goToNextQuestion();
}

void submitAnswer(BuildContext context) {
  BlocProvider.of<AllQuestionsCubit>(context).updateScore();
}

Color getBackGroundColorAfterSubmit({
  required int id,
  required String currentChoosedAnwser,
  required int choosedAnswerIndex,
  required bool isDark,
}) {
  if (currentChoosedAnwser == "true") {
    return AppColors.greenColor;
  } else {
    if (id == choosedAnswerIndex) {
      return AppColors.redColor;
    } else {
      if (isDark) {
        return AppColors.blackColor;
      } else {
        return AppColors.whiteColor;
      }
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

Color getShapeColorAswerItem(BuildContext context, bool isSelected) {
  if (isSelected) {
    return AppColors.orangeColor;
  } else {
    if (BlocProvider.of<SettingsCubit>(context).getApptheme()) {
      return AppColors.whiteColor;
    } else {
      return AppColors.blackColor;
    }
  }
}

Color getBackGroundColorAswerItem(BuildContext context, bool isSelected) {
  if (isSelected) {
    return AppColors.yellowColor;
  } else {
    if (BlocProvider.of<SettingsCubit>(context).getApptheme()) {
      return AppColors.blackColor;
    } else {
      return AppColors.whiteColor;
    }
  }
}

Color getTextColorAswerItem(BuildContext context, bool isSelected) {
  if (isSelected) {
    return AppColors.blackColor;
  } else {
    if (BlocProvider.of<SettingsCubit>(context).getApptheme()) {
      return AppColors.whiteColor;
    } else {
      return AppColors.blackColor;
    }
  }
}

Color getColorTextAfterSubmit({
  required bool isSelected,
  required String isCorrect,
  required bool isDark,
}) {
  if ((isSelected && isCorrect == "false") || isCorrect == "true" || !isDark) {
    return AppColors.blackColor;
  } else {
    return AppColors.whiteColor;
  }
}
