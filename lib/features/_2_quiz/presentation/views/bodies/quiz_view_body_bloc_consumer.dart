import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_view/all_questions_cubit/all_questions_cubit.dart';
import '../widgets/loading_views/_0_loading_main_view.dart';
import 'quiz_view_body.dart';

class QuizViewbodyBlocBuilder extends StatefulWidget {
  const QuizViewbodyBlocBuilder({super.key});

  @override
  State<QuizViewbodyBlocBuilder> createState() =>
      _QuizViewbodyBlocBuilderState();
}

class _QuizViewbodyBlocBuilderState extends State<QuizViewbodyBlocBuilder> {
  @override
  void initState() {
    BlocProvider.of<AllQuestionsCubit>(context)
        .fetchAllQuestions(category: "Linux");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllQuestionsCubit, AllQuestionsState>(
      builder: (context, state) {
        if (state is AllQuestionsSuccess) {
          return QuizViewbody(
            questions: state.questionsList,
          );
        } else if (state is AllQuestionsGoToNextQuestion) {
          //return const LoadingMainView();
          return QuizViewbody(
            questions: state.questionsList,
          );
        } else if (state is AllQuestionsUserSubmit) {
          return QuizViewbody(
            questions: state.questionsList,
          );
        } else if (state is AllQuestionsFailure) {
          return Center(
            child: Text(
              state.errMessage,
            ),
          );
        } else {
          return const LoadingMainView();
        }
      },
    );
  }
}
