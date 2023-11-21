import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quizify_app/features/_1_home/presentation/model_view/cubits/settings_cubit/settings_cubit.dart';

import '../../../../../core/utils/AsstesApp.dart';
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
    if (BlocProvider.of<SettingsCubit>(context).getSoundApp()) {
      if (isPassed) {
        assetsAudioPlayerFinal.open(
          Audio(AssetsSound.finalSuccessSound),
        );
      } else {
        assetsAudioPlayerFinal.open(
          Audio(AssetsSound.finalFailureSound),
        );
      }
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
