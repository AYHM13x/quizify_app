part of 'all_questions_cubit.dart';

abstract class AllQuestionsState extends Equatable {
  const AllQuestionsState();

  @override
  List<Object> get props => [];
}

class AllQuestionsInitial extends AllQuestionsState {}

class AllQuestionsLoading extends AllQuestionsState {}

class AllQuestionsUserAnswered extends AllQuestionsState {
  final List<QuestionModel> questions;

  const AllQuestionsUserAnswered(this.questions);
}

class AllQuestionsUserSubmit extends AllQuestionsState {
  final List<QuestionModel> questions;

  const AllQuestionsUserSubmit(this.questions);
}

class AllQuestionsSuccess extends AllQuestionsState {
  final List<QuestionModel> questions;

  const AllQuestionsSuccess(this.questions);
}

class AllQuestionsFailure extends AllQuestionsState {
  final String errMessage;

  const AllQuestionsFailure(this.errMessage);
}
