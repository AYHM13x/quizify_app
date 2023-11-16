import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/styles.dart';

import '../../../../../core/utils/functions/quiz_functions.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';

class TheFinalResultTextView extends StatelessWidget {
  const TheFinalResultTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getTheFinalResultTextView(context),
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(32),
        Text(
          "your result is: ${BlocProvider.of<AllQuestionsCubit>(context).getTheFinalResult()}%",
          style: Styles.textStyle30,
        ),
      ],
    );
  }
}
