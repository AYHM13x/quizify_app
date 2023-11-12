import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/AsstesApp.dart';
import 'core/utils/app_routrer.dart';
import 'core/utils/service_locater.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocater();
  runApp(const QuizifyApp());
}

class QuizifyApp extends StatelessWidget {
  const QuizifyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light, // LightMode
        fontFamily: FontFamilies.comicSansMS,
        //scaffoldBackgroundColor: Colors.red,
      ),
    );
  }
}
