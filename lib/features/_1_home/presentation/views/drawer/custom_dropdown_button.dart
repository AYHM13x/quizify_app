import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify_app/core/utils/cubits/settings_cubit/settings_cubit.dart';
import 'package:quizify_app/core/utils/dimensions_of_screen.dart';

import '../../../../../constants.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String dropdownValue = kDiffculty[0];

  void dropdownCallBack(String? selctiveValue) {
    if (selctiveValue is String) {
      setState(() {
        debugPrint(selctiveValue);
        if (selctiveValue == "Randomly") {
          BlocProvider.of<SettingsCubit>(context).setDifficulty("");
        } else {
          BlocProvider.of<SettingsCubit>(context).setDifficulty(selctiveValue);
        }
        dropdownValue = selctiveValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DimensionsOfScreen.dimensionsOfWidth(context, 70),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isExpanded: true,
            value: dropdownValue,
            onChanged: dropdownCallBack,
            alignment: AlignmentDirectional.center,
            borderRadius: BorderRadius.circular(22),
            items: [
              DropdownMenuItem(
                value: kDiffculty[0],
                child: Text(kDiffculty[0]),
              ),
              DropdownMenuItem(
                value: kDiffculty[1],
                child: Text(kDiffculty[1]),
              ),
              DropdownMenuItem(
                value: kDiffculty[2],
                child: Text(kDiffculty[2]),
              ),
              DropdownMenuItem(
                value: kDiffculty[3],
                child: Text(kDiffculty[3]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
