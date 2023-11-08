import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routrer.dart';
import 'core/utils/theme_provider.dart';

void main() {
  runApp(const QuizifyApp());
}

class QuizifyApp extends StatefulWidget {
  const QuizifyApp({super.key});

  @override
  State<QuizifyApp> createState() => _QuizifyAppState();
}

class _QuizifyAppState extends State<QuizifyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).currentTheme,
      ),
    );
  }
}
