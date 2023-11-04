import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizify_app/constants.dart';
import 'package:quizify_app/core/utils/AsstesApp.dart';

import '../../../../../core/utils/app_routrer.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import '../widgets/category_quiz_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 87),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: kCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.quizViewPath);
            },
            child: CategoryQuizItem(
              categoryName: kCategories[index],
              categoryImage: AssetsImage.categoriesImages[index],
            ),
          );
        },
      ),
    );
  }
}
