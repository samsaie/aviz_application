import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants/color.dart';

class SwitchIcon extends StatefulWidget {
  const SwitchIcon({super.key});

  @override
  State<SwitchIcon> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchIcon> {
  bool on = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: FittedBox(
        fit: BoxFit.contain,
        child: CupertinoSwitch(
          value: on,
          trackColor: AppColors.red,
          activeColor: AppColors.grey400,
          thumbColor: Colors.white,
          onChanged: (bool value) {
            setState(() {
              on = value;
            });
          },
        ),
      ),
    );
  }
}
