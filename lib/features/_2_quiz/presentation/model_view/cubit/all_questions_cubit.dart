import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';
import 'package:quizify_app/features/_2_quiz/data/repos/quiz_repo.dart';

part 'all_questions_state.dart';

class AllQuestionsCubit extends Cubit<AllQuestionsState> {
  AllQuestionsCubit(this.quizRepo) : super(AllQuestionsInitial());
  final QuizRepo quizRepo;
  List<QuestionModel> questionsList = [];
  int currentQuestion = 0;
  int choosedAnswerIndex = -1;
  int correctAnswer = 0, worngAnswer = 0;

  Future<void> fetchAllQuestions({required String category}) async {
    _initValues();
    emit(AllQuestionsLoading());
    var result = await quizRepo.fetchquestions(category: category);

    result.fold(
      (failure) {
        emit(
          AllQuestionsFailure(failure.errMessage),
        );
      },
      (listOfQuestions) {
        questionsList = listOfQuestions;
        emit(
          AllQuestionsSuccess(listOfQuestions),
        );
      },
    );
  }

  void userChoosed() {
    if (choosedAnswerIndex != -1) {
      emit(AllQuestionsUserAnswered());
    }
    emit(AllQuestionsSuccess(questionsList));
  }

  void _initValues() {
    currentQuestion = 0;
    choosedAnswerIndex = -1;
    correctAnswer = 0;
    worngAnswer = 0;
  }
}
