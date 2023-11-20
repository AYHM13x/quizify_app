import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../data/question_model/question_model.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';
import '../appbar/quiz_view_app_bar.dart';
import '_2_quiz_view_body_dynamic.dart';

class QuizViewbody extends StatefulWidget {
  const QuizViewbody({
    super.key,
    required this.category,
    required this.questions,
  });
  final String category;
  final List<QuestionModel> questions;

  @override
  State<QuizViewbody> createState() => _QuizViewbodyState();
}

class _QuizViewbodyState extends State<QuizViewbody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AllQuestionsCubit, AllQuestionsState>(
      listener: (context, state) {
        if (state is AllQuestionsUserAnswered ||
            state is AllQuestionsUserSubmit ||
            state is AllQuestionsGoToNextQuestion) {
          setState(() {});
        }
      },
      child: Column(
        children: [
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: QuizViewAppBar(
              text: "${widget.category} Quiz",
            ),
          ),
          const Gap(16),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: DimensionsOfScreen.dimensionsOfHeight(context, 86),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: QuizViewBodyDynamic(
                          questions: widget.questions,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
