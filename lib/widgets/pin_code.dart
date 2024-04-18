import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Constants/color.dart';

Widget pinCodeBox(BuildContext context) {
  TextEditingController controller = TextEditingController();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: PinCodeTextField(
          appContext: context,
          length: 4,
          controller: controller,
          cursorHeight: 20,
          enableActiveFill: true,
          textStyle: const TextStyle(fontFamily: 'sm', fontSize: 16),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldWidth: 80,
            inactiveColor: AppColors.grey300,
            selectedColor: AppColors.red,
            activeFillColor: AppColors.grey300,
            selectedFillColor: AppColors.grey300,
            inactiveFillColor: AppColors.grey300,
            activeColor: AppColors.grey300,
            borderRadius: BorderRadius.circular(6),
          ),
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    ],
  );
}
