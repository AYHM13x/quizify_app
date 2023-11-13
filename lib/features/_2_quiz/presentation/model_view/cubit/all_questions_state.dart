part of 'all_questions_cubit.dart';

abstract class AllQuestionsState extends Equatable {
  const AllQuestionsState();

  @override
  List<Object> get props => [];
}

class AllQuestionsInitial extends AllQuestionsState {}

class AllQuestionsLoading extends AllQuestionsState {}

class AllQuestionsUserAnswered extends AllQuestionsState {
  final List<QuestionModel> questionsList;

  const AllQuestionsUserAnswered(this.questionsList);
}

class AllQuestionsUserSubmit extends AllQuestionsState {
  final List<QuestionModel> questionsList;

  const AllQuestionsUserSubmit(this.questionsList);
}

class AllQuestionsSuccess extends AllQuestionsState {
  final List<QuestionModel> questionsList;

  const AllQuestionsSuccess(this.questionsList);
}

class AllQuestionsGoToNextQuestion extends AllQuestionsState {
  final List<QuestionModel> questionsList;

  const AllQuestionsGoToNextQuestion(this.questionsList);
}

class AllQuestionsFailure extends AllQuestionsState {
  final String errMessage;

  const AllQuestionsFailure(this.errMessage);
}
