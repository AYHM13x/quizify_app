import 'package:dartz/dartz.dart';
import 'package:quizify_app/features/_2_quiz/data/repos/quiz_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../question_model/question_model.dart';

class QuiuzRepoImpl implements QuizRepo {
  final ApiService apiService;
  final String apiKey = "VVFqypYHVmNG03q2pgF02XdAv1hlVXC1rRRqkuu1";
  late final String _endPoint = "questions?apiKey=$apiKey";

  QuiuzRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<QuestionModel>>> fetchquestions(
      {required String category}) async {
    List<QuestionModel> data =
        await apiService.get(endPoint: "$_endPoint&category=$category");
    List<QuestionModel> questions = [];
    if (data is List) {
      for (var item in data) {
        questions.add(QuestionModel.fromJson(item));
      }
    }

    return;
  }
}
