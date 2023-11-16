import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/dimensions_of_screen.dart';

import '../app_bar/home_view_app_bar.dart';
import '../list_view/category_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Gap(8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: HomeViewAppBar(),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 87),
            child: const CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CategoryListView(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
