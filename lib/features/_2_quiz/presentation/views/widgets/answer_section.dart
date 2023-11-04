import 'package:flutter/material.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import 'answer_item.dart';

class AswerSection extends StatelessWidget {
  const AswerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 58),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return AnswerItem(
            index: index + 1,
          );
        },
      ),
    );
  }
}
