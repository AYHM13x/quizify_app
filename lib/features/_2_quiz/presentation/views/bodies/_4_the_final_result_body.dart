import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/styles.dart';
import '../../model_view/all_questions_cubit/all_questions_cubit.dart';
import '../widgets/_4_the_final_result_score_view.dart';
import '../widgets/_5_the_final_result_text_view.dart';

class TheFinalResultBody extends StatefulWidget {
  const TheFinalResultBody({
    super.key,
  });

  @override
  State<TheFinalResultBody> createState() => _TheFinalResultBodyState();
}

class _TheFinalResultBodyState extends State<TheFinalResultBody> {
  late bool isPassed;
  @override
  void initState() {
    super.initState();
    AssetsAudioPlayer assetsAudioPlayerFinal = AssetsAudioPlayer();
    isPassed =
        BlocProvider.of<AllQuestionsCubit>(context).getTheFinalResult() > 60.0;
    if (isPassed) {
      assetsAudioPlayerFinal.open(
        Audio("assets/sounds/final_success.mp3"),
      );
    } else {
      assetsAudioPlayerFinal.open(
        Audio("assets/sounds/final_failure.mp3"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(32),
        const Text(
          "Final Result",
          style: Styles.textStyle50,
        ),
        const TheFinalResultScoreView(),
        const Gap(32),
        TheFinalResultTextView(
          isPassed: isPassed,
        ),
      ],
    );
  }
}
