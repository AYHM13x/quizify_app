import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

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
            "Confirm",
            style: Styles.textStyle16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
