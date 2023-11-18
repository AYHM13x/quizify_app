import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/core/utils/cubits/settings_cubit/settings_cubit.dart';

import 'core/utils/AsstesApp.dart';
import 'core/utils/app_routrer.dart';
import 'core/utils/service_locater.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocater();
  runApp(BlocProvider(
    create: (context) => SettingsCubit(),
    child: const QuizifyApp(),
  ));
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
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsDarkAppTheme || state is SettingsLightAppTheme) {
          setState(() {});
        }
      },
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: BlocProvider.of<SettingsCubit>(context).getApptheme()
              ? Brightness.dark
              : Brightness.light,
          fontFamily: FontFamilies.comicSansMS,
        ),
      ),
    );
  }
}
