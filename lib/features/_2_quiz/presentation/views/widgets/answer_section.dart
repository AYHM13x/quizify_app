import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';
import 'package:quizify_app/features/_2_quiz/presentation/model_view/cubit/all_questions_cubit.dart';
import 'package:quizify_app/features/_2_quiz/presentation/views/widgets/answer_item_after_user_submit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import 'answer_item.dart';

class AswerSection extends StatefulWidget {
  const AswerSection({
    super.key,
    required this.question,
  });
  final QuestionModel question;
  @override
  State<AswerSection> createState() => _AswerSectionState();
}

class _AswerSectionState extends State<AswerSection> {
  int selectedAnswer = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 70),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.question.answers!.answerList.length,
        itemBuilder: (BuildContext context, int index) {
          if (!BlocProvider.of<AllQuestionsCubit>(context).isUserSubmitAnswer) {
            return AswerItem(
              id: index + 1,
              answerText: widget.question.answers!.answerList[index] ??
                  kThereIsNoAnswer,
              onPressed: () {
                selectedAnswer = index;
                BlocProvider.of<AllQuestionsCubit>(context).choosedAnswerIndex =
                    index;
                BlocProvider.of<AllQuestionsCubit>(context).userChoosed();
                setState(() {});
              },
              isSelected: selectedAnswer == index ? true : false,
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
