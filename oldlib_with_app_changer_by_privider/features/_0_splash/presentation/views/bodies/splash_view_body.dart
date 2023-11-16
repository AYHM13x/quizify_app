import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/app_routrer.dart';
import '../../../../../core/utils/styles.dart';
import '../animated_widgets/animated_app_logo.dart';
import '../animated_widgets/animated_text_in_splash_view_body.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingDownCrownAnimation;
  late Animation<Offset> slidingUpTextAnimation;

  @override
  void initState() {
    super.initState();

    initSildingText();

    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedCrownLogo(
          slidingAnimation: slidingDownCrownAnimation,
        ),
        Text(
          kAppName,
          //"𝓥𝓲𝓻𝓽𝓾𝓪𝓵 𝓢𝓱𝓸𝓹",
          style: Styles.textStyle60.copyWith(
            fontFamily: FontFamilies.dancingScript,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 4,
        ),
        AnimatedTextInSplashViewBody(
          slidingUpAnimation: slidingUpTextAnimation,
        ),
      ],
    );
  }

  void initSildingText() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    slidingDownCrownAnimation =
        Tween<Offset>(begin: const Offset(0, -5), end: Offset.zero)
            .animate(animationController);
    slidingUpTextAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      GoRouter.of(context).push(AppRouter.homeViewPath);
    });
  }
}
