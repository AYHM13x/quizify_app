import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/AsstesApp.dart';
import '../../../../_1_home/presentation/model_view/cubits/settings_cubit/settings_cubit.dart';

class QuizViewAppBar extends StatefulWidget {
  const QuizViewAppBar({super.key, this.text});
  final String? text;

  @override
  State<QuizViewAppBar> createState() => _QuizViewAppBarState();
}

class _QuizViewAppBarState extends State<QuizViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          kAppName,
          style: Styles.textStyle30.copyWith(
            fontFamily: FontFamilies.dancingScript,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          widget.text ?? "",
          style: Styles.textStyle30,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            BlocProvider.of<SettingsCubit>(context).changeAppTheme();
            setState(() {});
          },
          icon: Icon(BlocProvider.of<SettingsCubit>(context).getApptheme()
              ? Icons.sunny
              : Icons.nightlight),
          iconSize: 34,
        )
      ],
    );
  }
}
