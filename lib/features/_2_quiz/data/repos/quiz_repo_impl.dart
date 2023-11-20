import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quizify_app/features/_2_quiz/data/repos/quiz_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../question_model/question_model.dart';

class QuizRepoImpl implements QuizRepo {
  final ApiService apiService;
  final String apiKey = "VVFqypYHVmNG03q2pgF02XdAv1hlVXC1rRRqkuu1";
  late final String _endPoint = "questions?apiKey=$apiKey";

  QuizRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<QuestionModel>>> fetchquestions({
    required String category,
    required String difficulty,
  }) async {
    try {
      List<dynamic> data = await apiService.get(
          endPoint: "$_endPoint&category=$category&difficulty=$difficulty");
      List<QuestionModel> questions = [];
      for (var item in data) {
        questions.add(QuestionModel.fromJson(item));
      }
      return right(questions);
    } catch (e) {
      debugPrint(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure("There was an Error: $e"));
    }
  }
}
