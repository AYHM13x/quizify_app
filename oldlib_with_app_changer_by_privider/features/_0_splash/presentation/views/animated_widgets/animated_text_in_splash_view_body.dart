import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class AnimatedTextInSplashViewBody extends StatelessWidget {
  const AnimatedTextInSplashViewBody({
    super.key,
    required this.slidingUpAnimation,
  });

  final Animation<Offset> slidingUpAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingUpAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingUpAnimation,
            child: Text(
              "Are You ready to Quiz??",
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
