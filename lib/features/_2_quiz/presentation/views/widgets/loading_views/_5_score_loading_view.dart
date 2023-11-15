import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';

class ScoreLoadingView extends StatelessWidget {
  const ScoreLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Correct Answers: ",
          style: Styles.textStyle18.copyWith(
            color: AppColors.greenColor,
          ),
        ),
        Text(
          "Wrong Answers:             ",
          style: Styles.textStyle18.copyWith(
            color: AppColors.redColor,
          ),
        ),
        // SizedBox(
        //   width: ,
        // )
      ],
    );
  }
}
