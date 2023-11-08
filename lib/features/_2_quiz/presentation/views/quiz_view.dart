import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/features/_2_quiz/data/repos/quiz_repo_impl.dart';
import 'package:quizify_app/features/_2_quiz/presentation/model_view/cubit/all_questions_cubit.dart';
import 'package:quizify_app/features/_2_quiz/presentation/views/bodies/quiz_view_body_bloc_consumer.dart';

import '../../../../core/utils/api_service.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllQuestionsCubit(QuiuzRepoImpl(ApiService(Dio()))),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: QuizViewbodyBlocConsumer(),
          ),
        ),
      ),
    );
  }
}
