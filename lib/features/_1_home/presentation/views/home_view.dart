import 'package:flutter/material.dart';

import 'bodies/home_view_body.dart';
import 'drawer/_0_custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        drawer: Drawer(
          child: CustomDrawer(),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: HomeViewBody(),
          ),
        ),
      ),
    );
  }
}
