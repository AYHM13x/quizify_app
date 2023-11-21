import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routrer.dart';
import '../../../../../core/utils/styles.dart';

class AboutMeButton extends StatelessWidget {
  const AboutMeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.aboutMeViewPath);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "About Me",
            style: Styles.textStyle16,
          ),
          Icon(
            Icons.arrow_right,
            size: 28,
          )
        ],
      ),
    );
  }
}
