import 'package:dartz/dartz.dart';
import 'package:quizify_app/features/_2_quiz/data/question_model/question_model.dart';

import '../../../../core/errors/failures.dart';

abstract class QuizRepo {
  Future<Either<Failure, List<QuestionModel>>> fetchquestions(
      {String category});
}
