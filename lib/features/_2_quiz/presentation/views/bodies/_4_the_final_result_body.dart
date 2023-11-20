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
  @override
  void initState() {
    super.initState();
    AssetsAudioPlayer assetsAudioPlayerFinalSuccess = AssetsAudioPlayer();
    AssetsAudioPlayer assetsAudioPlayerFinalFailure = AssetsAudioPlayer();
    bool isPassed =
        BlocProvider.of<AllQuestionsCubit>(context).getTheFinalResult() > 60.0;
    if (isPassed) {
      assetsAudioPlayerFinalSuccess.open(
        Audio("assets/sounds/final_success.mp3"),
      );
    } else {
      assetsAudioPlayerFinalFailure.open(
        Audio("assets/sounds/final_failure.mp3"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(32),
        Text(
          "Final Result",
          style: Styles.textStyle50,
        ),
        TheFinalResultScoreView(),
        Gap(32),
        TheFinalResultTextView(),
      ],
    );
  }
}
