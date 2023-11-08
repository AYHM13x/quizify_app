import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_view/cubit/all_questions_cubit.dart';
import 'quiz_view_body.dart';

class QuizViewbodyBlocConsumer extends StatefulWidget {
  const QuizViewbodyBlocConsumer({super.key});

  @override
  State<QuizViewbodyBlocConsumer> createState() =>
      _QuizViewbodyBlocConsumerState();
}

class _QuizViewbodyBlocConsumerState extends State<QuizViewbodyBlocConsumer> {
  @override
  void initState() {
    BlocProvider.of<AllQuestionsCubit>(context)
        .fetchAllQuestions(category: "Linux");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllQuestionsCubit, AllQuestionsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AllQuestionsSuccess) {
          return QuizViewbody(
            questions: state.questions,
          );
        } else if (state is AllQuestionsFailure) {
          return Center(
            child: Text(
              state.errMessage,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
