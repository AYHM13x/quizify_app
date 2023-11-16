import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/core/utils/app_colors.dart';
import 'package:quizify_app/core/utils/cubits/settings_cubit/settings_cubit.dart';

import '../../../../../core/utils/styles.dart';

class QuestionTextSection extends StatefulWidget {
  const QuestionTextSection({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<QuestionTextSection> createState() => _QuestionTextSectionState();
}

class _QuestionTextSectionState extends State<QuestionTextSection> {
  @override
  Widget build(BuildContext context) {
    //bool isDark = BlocProvider.of<SettingsCubit>(context).getApptheme();
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsDarkAppTheme || state is SettingsLightAppTheme) {
          setState(() {});
        }
      },
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
              color: BlocProvider.of<SettingsCubit>(context).getApptheme()
                  ? AppColors.whiteColor
                  : AppColors.blackColor),
        ),
        child: Text(
          widget.text,
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
