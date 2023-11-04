import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    super.key,
    required this.index,
  });
  final int index;
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
            AppColors.greyColor,
          ),
        ),
        child: Container(
          height: 55,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(
            "Answer number $index",
            style: Styles.textStyle16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

class Bottonn extends StatelessWidget {
  const Bottonn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: const Text(""));
  }
}


// Container(
//           width: double.maxFinite,
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(22),
//             border: Border.all(color: AppColors.whiteColor),
//             color: AppColors.greyColor,
//           ),
//           child: Text(
//             "Answer number $index",
//             style: Styles.textStyle16.copyWith(
//               color: AppColors.whiteColor,
//             ),
//           ),
//         )