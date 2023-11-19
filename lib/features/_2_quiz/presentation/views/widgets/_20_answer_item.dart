import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/get_color_functions.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../_1_home/presentation/model_view/cubits/settings_cubit/settings_cubit.dart';

class AswerItem extends StatefulWidget {
  const AswerItem({
    super.key,
    required this.id,
    required this.answerText,
    this.isSelected = false,
    this.onPressed,
  });

  final int id;
  final String? answerText;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  State<AswerItem> createState() => _AswerItemState();
}

class _AswerItemState extends State<AswerItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.answerText != kThereIsNoAnswer) {
      return BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SettingsDarkAppTheme || state is SettingsLightAppTheme) {
            setState(() {});
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                  side: BorderSide(
                    color: getShapeColorAswerItem(context, widget.isSelected),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                getBackGroundColorAswerItem(context, widget.isSelected),
              ),
            ),
            child: Container(
              height: 65,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: Text(
                "${widget.id} - ${widget.answerText}",
                style: Styles.textStyle16.copyWith(
                  color: getTextColorAswerItem(context, widget.isSelected),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return const Center();
    }
  }
}
