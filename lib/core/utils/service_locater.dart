import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quizify_app/features/_2_quiz/data/repos/quiz_repo_impl.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocater() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<QuizRepoImpl>(
    QuizRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
