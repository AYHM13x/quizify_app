import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class CategoryQuizItem extends StatelessWidget {
  const CategoryQuizItem({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });

  final String categoryName, categoryImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Container(
        //height: 240,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                categoryImage,
              ),
            ),
            //const Gap(5),
            Text(
              categoryName,
              style: Styles.textStyle18.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
