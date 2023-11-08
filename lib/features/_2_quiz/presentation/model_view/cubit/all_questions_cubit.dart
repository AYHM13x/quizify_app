import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';
import 'package:quizify_app/features/_2_quiz/data/repos/quiz_repo.dart';

part 'all_questions_state.dart';

class AllQuestionsCubit extends Cubit<AllQuestionsState> {
  AllQuestionsCubit(this.quizRepo) : super(AllQuestionsInitial());
  final QuizRepo quizRepo;

  Future<void> fetchAllQuestions({required String category}) async {
    emit(AllQuestionsLoading());
    var result = await quizRepo.fetchquestions(category: category);

    result.fold(
      (failure) {
        emit(
          AllQuestionsFailure(failure.errMessage),
        );
      },
      (listOfQuestions) {
        emit(
          AllQuestionsSuccess(listOfQuestions),
        );
      },
    );
  }
}
