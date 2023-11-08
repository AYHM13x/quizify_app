import 'package:flutter/material.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import 'answer_item.dart';

class AswerSection extends StatefulWidget {
  const AswerSection({
    super.key,
  });

  @override
  State<AswerSection> createState() => _AswerSectionState();
}

class _AswerSectionState extends State<AswerSection> {
  int selectedAnswer = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 57),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return AswerItem(
            text: "${index + 1} - option",
            onPressed: () {
              selectedAnswer = index;
              setState(() {});
            },
            isSelected: selectedAnswer == index ? true : false,
          );
        },
      ),
    );
  }
}
