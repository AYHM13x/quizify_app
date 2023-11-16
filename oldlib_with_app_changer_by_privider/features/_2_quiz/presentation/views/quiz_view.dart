import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locater.dart';
import '../../data/repos/quiz_repo_impl.dart';
import '../model_view/all_questions_cubit/all_questions_cubit.dart';
import 'bodies/quiz_view_body_bloc_consumer.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllQuestionsCubit(
        getIt.get<QuizRepoImpl>(),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: QuizViewbodyBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
