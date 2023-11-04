import 'package:flutter/material.dart';
import 'package:quizify_app/features/_2_quiz/presentation/views/bodies/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: QuizViewbody(),
        ),
      ),
    );
  }
}
