import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizify_app/features/_0_splash/presentation/views/splash_view.dart';
import 'package:quizify_app/features/_1_home/presentation/views/about_me/_0_about_me_view.dart';

import '../../features/_1_home/presentation/views/home_view.dart';
import '../../features/_2_quiz/presentation/views/quiz_view.dart';

abstract class AppRouter {
  //Paths
  static String splashViewPath = "/";
  static String homeViewPath = "/homeView";
  static String aboutMeViewPath = "/homeView/AboutMeViewPath";
  static String quizViewPath = "/homeView/QuizView";

  static final RouterConfig<Object> router = GoRouter(
    routes: [
      GoRoute(
        path: splashViewPath,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewPath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: aboutMeViewPath,
        builder: (context, state) => const AboutMeView(),
      ),
      GoRoute(
        path: quizViewPath,
        builder: (context, state) => QuizView(
          category: state.extra as String,
        ),
      ),
    ],
  );
}

// ItemsView
