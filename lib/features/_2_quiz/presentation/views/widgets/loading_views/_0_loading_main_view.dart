import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/core/utils/dimensions_of_screen.dart';

import '../../../../../../core/custom_widgets/custom_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../appbar/quiz_view_app_bar.dart';
import '_1_question_loading_section.dart';
import '_5_score_loading_view.dart';

class LoadingMainView extends StatelessWidget {
  const LoadingMainView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: QuizViewAppBar(
            text: "$category Quiz",
          ),
        ),
        const Gap(16),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 86),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: QuestionLoadingView(),
                    ),
                    const Divider(
                      height: 8,
                      thickness: 5,
                      color: AppColors.greyColor,
                    ),
                    const ScoreLoadingView(),
                    const Gap(16),
                    CutsomButton(
                      text: "Confirm",
                      isPressable: false,
                      onPressed: () {},
                    ),
                    CutsomButton(
                      text: "Next Question",
                      isPressable: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Dddddd extends StatelessWidget {
  const Dddddd({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: QuestionLoadingView(),
              ),
              const Divider(
                height: 8,
                thickness: 5,
                color: AppColors.greyColor,
              ),
              const ScoreLoadingView(),
              CutsomButton(
                text: "Confirm",
                isPressable: false,
                onPressed: () {},
              ),
              CutsomButton(
                text: "Next Question",
                isPressable: false,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
