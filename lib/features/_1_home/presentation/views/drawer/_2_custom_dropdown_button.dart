import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../model_view/cubits/settings_cubit/settings_cubit.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: DimensionsOfScreen.dimensionsOfWidth(context, 70),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isExpanded: true,
            value: dropdownValue(),
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

  void dropdownCallBack(String? selctiveValue) {
    if (selctiveValue is String) {
      setState(() {
        debugPrint(selctiveValue);
        if (selctiveValue == "Randomly") {
          BlocProvider.of<SettingsCubit>(context).setDifficulty("");
        } else {
          BlocProvider.of<SettingsCubit>(context).setDifficulty(selctiveValue);
        }
      });
    }
  }

  String dropdownValue() {
    if (BlocProvider.of<SettingsCubit>(context).getDifficulty() == "") {
      return "Randomly";
    } else {
      return BlocProvider.of<SettingsCubit>(context).getDifficulty();
    }
  }
}
