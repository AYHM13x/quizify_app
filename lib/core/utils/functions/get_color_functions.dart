import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_colors.dart';
import '../cubits/settings_cubit/settings_cubit.dart';

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

Color getColorDifficulty(BuildContext context, String text) {
  if (text == "Easy") {
    return AppColors.darkGreenColor;
  } else if (text == "Medium") {
    return AppColors.orangeColor;
  } else {
    return AppColors.redColor;
  }
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
