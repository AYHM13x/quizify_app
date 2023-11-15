import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/features/_2_quiz/presentation/views/widgets/loading_views/_2_question_text_loading_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/utils/app_colors.dart';
import '_3_question_answer_list_loading_view.dart';

class QuestionLoadingView extends StatelessWidget {
  const QuestionLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor,
      highlightColor: AppColors.whiteColor,
      child: Column(
        children: [
          const QuestionTextLoadingView(),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("id:"),
              Row(
                children: [
                  const Text("difficulty:"),
                  Container(
                    width: 50,
                    color: AppColors.greyColor,
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            height: 8,
            thickness: 5,
            color: AppColors.greyColor,
          ),
          const Gap(8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: QuestionAnswerListLoadingView(),
          ),
        ],
      ),
    );
  }
}
