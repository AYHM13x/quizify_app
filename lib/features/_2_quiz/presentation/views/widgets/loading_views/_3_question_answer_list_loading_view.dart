import 'package:flutter/material.dart';

import '../../../../../../core/utils/dimensions_of_screen.dart';
import '_4_question_answer_item_loading_view.dart';

class QuestionAnswerListLoadingView extends StatelessWidget {
  const QuestionAnswerListLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 66),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return QuestionAnswerItemLoadingView(
            id: index,
          );
        },
      ),
    );
  }
}
