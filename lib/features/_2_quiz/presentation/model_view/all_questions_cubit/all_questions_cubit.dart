import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';
import 'package:quizify_app/features/_2_quiz/data/repos/quiz_repo.dart';

import '../../../../../core/utils/AsstesApp.dart';

part 'all_questions_state.dart';

class AllQuestionsCubit extends Cubit<AllQuestionsState> {
  AllQuestionsCubit(this.quizRepo) : super(AllQuestionsInitial());
  final QuizRepo quizRepo;

  List<QuestionModel> questionsList = [];
  int _currentQuestion = 0;
  int _choosedAnswerIndex = -1;
  int _correctAnswer = 0, _worngAnswer = 0;
  bool _isUserChooseAnswer = false;
  bool _isUserSubmitAnswer = false;
  late final AssetsAudioPlayer assetsAudioPlayer;

  void _initValues() {
    _currentQuestion = 0;
    _choosedAnswerIndex = -1;
    _correctAnswer = 0;
    _worngAnswer = 0;
    _isUserSubmitAnswer = false;
    _isUserChooseAnswer = false;
    assetsAudioPlayer = AssetsAudioPlayer();
  }

  Future<void> fetchAllQuestions(
      {required String category, required String difficulty}) async {
    _initValues();
    emit(AllQuestionsLoading());
    var result = await quizRepo.fetchquestions(
      category: category,
      difficulty: difficulty,
    );

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

  List<QuestionModel> getQuestionList() => questionsList;

  QuestionModel getCurrentQuestion() => questionsList[_currentQuestion];

  void userChoosed() {
    if (_choosedAnswerIndex != -1) {
      _isUserChooseAnswer = true;
      emit(AllQuestionsUserAnswered(questionsList));
    }
    emit(AllQuestionsSuccess(questionsList));
  }

  int getQuestionListLength() => questionsList.length;

  int getChoosedAnswerIndex() => _choosedAnswerIndex;

  void setChoosedAnswerIndex(int choosedIndex) {
    _choosedAnswerIndex = choosedIndex;
  }

  void updateScore({bool isNotMuted = true}) {
    if (questionsList[_currentQuestion]
            .correctAnswers!
            .correctAnswerList[_choosedAnswerIndex] ==
        "true") {
      if (isNotMuted) {
        assetsAudioPlayer.open(
          Audio(AssetsSound.successSound),
        );
      }

      _correctAnswer++;
    } else {
      if (isNotMuted) {
        assetsAudioPlayer.open(
          Audio(AssetsSound.failSound),
        );
      }

      _worngAnswer++;
    }
    _isUserSubmitAnswer = true;
    emit(AllQuestionsUserSubmit(
      questionsList,
    ));
  }

  int getCorrectAnswersResult() => _correctAnswer;

  int getWorngAnswersResult() => _worngAnswer;

  bool isSubmitButtonAvaliable() {
    if (_isUserChooseAnswer && !_isUserSubmitAnswer) {
      return true;
    } else {
      return false;
    }
  }

  bool getSubmitVar() => _isUserSubmitAnswer;

  bool isAvaliableToGoToNextQuestion() {
    return _isUserSubmitAnswer ? true : false;
  }

  int getCurrentQuestionIndex() => _currentQuestion;

  void goToNextQuestion() {
    _currentQuestion++;
    _choosedAnswerIndex = -1;
    _isUserSubmitAnswer = false;
    _isUserChooseAnswer = false;
    emit(AllQuestionsGoToNextQuestion(questionsList));
  }

  double getTheFinalResult() {
    double result = (_correctAnswer / questionsList.length) * 100.0;
    return result.roundToDouble();
  }
}
