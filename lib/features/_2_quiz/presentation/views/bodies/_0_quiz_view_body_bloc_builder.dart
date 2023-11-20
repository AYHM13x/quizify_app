import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/features/_1_home/presentation/model_view/cubits/settings_cubit/settings_cubit.dart';

import '../../model_view/all_questions_cubit/all_questions_cubit.dart';
import '../widgets/loading_views/_0_loading_main_view.dart';
import '_1_quiz_view_body.dart';

class QuizViewbodyBlocBuilder extends StatefulWidget {
  const QuizViewbodyBlocBuilder({super.key, required this.category});
  final String category;

  @override
  State<QuizViewbodyBlocBuilder> createState() =>
      _QuizViewbodyBlocBuilderState();
}

class _QuizViewbodyBlocBuilderState extends State<QuizViewbodyBlocBuilder> {
  @override
  void initState() {
    BlocProvider.of<AllQuestionsCubit>(context).fetchAllQuestions(
      category: widget.category,
      difficulty: BlocProvider.of<SettingsCubit>(context).getDifficulty(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllQuestionsCubit, AllQuestionsState>(
      builder: (context, state) {
        if (state is AllQuestionsSuccess ||
            state is AllQuestionsUserSubmit ||
            state is AllQuestionsGoToNextQuestion) {
          return QuizViewbody(
            category: widget.category,
            questions:
                BlocProvider.of<AllQuestionsCubit>(context).getQuestionList(),
          );
        } else if (state is AllQuestionsFailure) {
          return Center(
            child: Text(
              state.errMessage,
            ),
          );
        } else {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const LoadingMainView(),
          );
        }
      },
    );
  }
}
