import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/core/utils/cubits/settings_cubit/settings_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

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

  Color getShapeColorAswerItem(BuildContext context, bool isSelected) {
    if (isSelected) {
      return AppColors.orangeColor;
    } else {
      if (BlocProvider.of<SettingsCubit>(context).getApptheme()) {
        return AppColors.whiteColor;
      } else {
        return AppColors.blackColor;
      }
    }
  }

  Color getBackGroundColorAswerItem(BuildContext context, bool isSelected) {
    if (isSelected) {
      return AppColors.yellowColor;
    } else {
      if (BlocProvider.of<SettingsCubit>(context).getApptheme()) {
        return AppColors.blackColor;
      } else {
        return AppColors.whiteColor;
      }
    }
  }

  Color getTextColorAswerItem(BuildContext context, bool isSelected) {
    if (isSelected) {
      return AppColors.blackColor;
    } else {
      if (BlocProvider.of<SettingsCubit>(context).getApptheme()) {
        return AppColors.whiteColor;
      } else {
        return AppColors.blackColor;
      }
    }
  }
}
