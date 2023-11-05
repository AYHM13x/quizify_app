import 'package:flutter/material.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/custom_widgets/custom_button.dart';

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
      height: DimensionsOfScreen.dimensionsOfHeight(context, 58),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return CutsomButton(
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
