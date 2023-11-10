import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class AswerItem extends StatelessWidget {
  const AswerItem({
    super.key,
    required this.id,
    required this.answerText,
    this.isSelected = false,
    this.onPressed,
  });

  final int id;
  final String? answerText;
  final bool isSelected;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    if (answerText != kThereIsNoAnswer) {
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
              isSelected ? AppColors.yellowColor : AppColors.blackColor,
            ),
          ),
          child: Container(
            height: 65,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            child: Text(
              "$id - $answerText",
              style: Styles.textStyle16.copyWith(
                color: isSelected ? AppColors.blackColor : AppColors.whiteColor,
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
