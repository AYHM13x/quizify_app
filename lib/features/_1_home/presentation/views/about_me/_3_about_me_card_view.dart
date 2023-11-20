import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class AboutMeCardView extends StatelessWidget {
  const AboutMeCardView({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final Icon icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: Colors.white,
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: Styles.textStyle18.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}


// size: 35.0,
//             color: const Color(0xFF2C5BAB),