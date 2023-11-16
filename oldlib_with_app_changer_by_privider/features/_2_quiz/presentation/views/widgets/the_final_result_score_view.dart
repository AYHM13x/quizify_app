import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';

class TheFinalResultScoreView extends StatelessWidget {
  const TheFinalResultScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "${BlocProvider.of<AllQuestionsCubit>(context).getCorrectAnswersResult()}",
          style: Styles.textStyle200.copyWith(color: AppColors.greenColor),
        ),
        SizedBox(
          width: 5,
          height: DimensionsOfScreen.dimensionsOfHeight(context, 33),
          child: const VerticalDivider(
            thickness: 5,
            color: AppColors.greyColor,
          ),
        ),
        Text(
          "${BlocProvider.of<AllQuestionsCubit>(context).getWorngAnswersResult()}",
          style: Styles.textStyle200.copyWith(color: AppColors.redColor),
        ),
      ],
    );
  }
}
