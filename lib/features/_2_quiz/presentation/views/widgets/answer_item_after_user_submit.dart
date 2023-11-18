import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/core/utils/cubits/settings_cubit/settings_cubit.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/functions/get_color_functions.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';

class AswerItemAfterUserSubmit extends StatefulWidget {
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
  State<AswerItemAfterUserSubmit> createState() =>
      _AswerItemAfterUserSubmitState();
}

class _AswerItemAfterUserSubmitState extends State<AswerItemAfterUserSubmit> {
  @override
  Widget build(BuildContext context) {
    if (widget.answerText != kThereIsNoAnswer) {
      return BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SettingsDarkAppTheme || state is SettingsLightAppTheme) {
            setState(() {});
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                  side: BorderSide(
                    color: BlocProvider.of<SettingsCubit>(context).getApptheme()
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                getBackGroundColorAfterSubmit(
                  id: widget.id,
                  currentChoosedAnwser: widget.question.correctAnswers!
                          .correctAnswerList[widget.id] ??
                      "false",
                  choosedAnswerIndex:
                      BlocProvider.of<AllQuestionsCubit>(context)
                          .getChoosedAnswerIndex(),
                  isDark: BlocProvider.of<SettingsCubit>(context).getApptheme(),
                ),
              ),
            ),
            child: Container(
              height: 65,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: Text(
                "${widget.id + 1} - ${widget.question.answers!.answerList[widget.id]}",
                style: Styles.textStyle16.copyWith(
                  color: getColorTextAfterSubmit(
                    isSelected: widget.isSelected,
                    isCorrect: widget
                        .question.correctAnswers!.correctAnswerList[widget.id]!,
                    isDark:
                        BlocProvider.of<SettingsCubit>(context).getApptheme(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return const Center();
    }
  }
}
