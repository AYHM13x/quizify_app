import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/question_model/question_model.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';
import 'quuiz_body_unfinished.dart';
import 'the_final_result_body.dart';

class QuizViewBodyDynamic extends StatelessWidget {
  const QuizViewBodyDynamic({super.key, required this.questions});
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<AllQuestionsCubit>(context).getCurrentQuestionIndex() <
        questions.length) {
      return QuizViewBodyUnFinished(
        questions: questions,
      );
    } else {
      return const TheFinalResultBody();
    }
  }
}
