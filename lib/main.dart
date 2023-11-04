import 'package:flutter/material.dart';

import 'core/utils/AsstesApp.dart';
import 'core/utils/app_routrer.dart';

void main() {
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
        brightness: Brightness.dark,
        fontFamily: FontFamilies.comicSansMS,
      ),
    );
  }
}
