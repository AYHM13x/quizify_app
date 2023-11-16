import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';

class QuestionAnswerItemLoadingView extends StatelessWidget {
  const QuestionAnswerItemLoadingView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
              side: const BorderSide(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            AppColors.blackColor,
          ),
        ),
        child: Container(
          height: 65,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8),
          child: Text(
            "$id - ",
            style: Styles.textStyle16,
          ),
        ),
      ),
    );
  }
}
