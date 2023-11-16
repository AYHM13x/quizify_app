import 'package:flutter/material.dart';

import '../../../../../core/utils/AsstesApp.dart';

class AnimatedCrownLogo extends StatelessWidget {
  const AnimatedCrownLogo({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: SizedBox(
              height: 150,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(AssetsImage.appLogo),
              ),
            ),
          );
        });
  }
}
