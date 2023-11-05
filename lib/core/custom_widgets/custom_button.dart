import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

class CutsomButton extends StatelessWidget {
  const CutsomButton(
      {super.key, required this.text, this.isSelected = false, this.onPressed});

  final String text;
  final bool isSelected;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
              side: BorderSide(
                color:
                    isSelected ? AppColors.orangeColor : AppColors.whiteColor,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            isSelected ? AppColors.yellowColor : AppColors.greyColor,
          ),
        ),
        child: Container(
          height: 55,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
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
