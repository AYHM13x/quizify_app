import 'package:flutter/material.dart';
import 'package:quizify_app/core/utils/styles.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.text,
    required this.value,
    required this.onChange,
  });
  final String text;
  final bool value;
  final void Function(bool) onChange;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: Styles.textStyle18,
        ),
        Switch(
          value: widget.value,
          onChanged: widget.onChange,
        )
      ],
    );
  }
}
