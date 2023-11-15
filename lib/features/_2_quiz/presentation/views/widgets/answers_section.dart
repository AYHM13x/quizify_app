import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/quiz_functions.dart';
import '../../../data/question_model/question_model.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';
import 'answer_item.dart';
import 'answer_item_after_user_submit.dart';

class AswersSection extends StatefulWidget {
  const AswersSection({
    super.key,
    required this.question,
  });
  final QuestionModel question;

  @override
  State<AswersSection> createState() => _AswersSectionState();
}

class _AswersSectionState extends State<AswersSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (65 *
              (getNumberOfAvailbleAnswers(
                  widget.question.answers!.answerList))) +
          22,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.question.answers!.answerList.length,
        itemBuilder: (BuildContext context, int index) {
          if (!BlocProvider.of<AllQuestionsCubit>(context).getSubmitVar()) {
            return AswerItem(
              id: index + 1,
              answerText: widget.question.answers!.answerList[index] ??
                  kThereIsNoAnswer,
              onPressed: () {
                BlocProvider.of<AllQuestionsCubit>(context)
                    .setChoosedAnswerIndex(index);
                BlocProvider.of<AllQuestionsCubit>(context).userChoosed();
                setState(() {});
              },
              isSelected: BlocProvider.of<AllQuestionsCubit>(context)
                          .getChoosedAnswerIndex() ==
                      index
                  ? true
                  : false,
            );
          } else {
            return AswerItemAfterUserSubmit(
              id: index,
              answerText: widget.question.answers!.answerList[index] ??
                  kThereIsNoAnswer,
              question: widget.question,
            );
          }
        },
      ),
    );
  }
}
