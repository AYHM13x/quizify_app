import 'package:flutter/material.dart';

import '_1_about_me_view_body.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: AboutMeViewBody(),
        ),
      ),
    );
  }
}
