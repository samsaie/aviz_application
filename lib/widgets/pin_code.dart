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
            inactiveColor: AppColors.backgroundGrey,
            selectedColor: AppColors.red,
            activeFillColor: AppColors.backgroundGrey,
            selectedFillColor: AppColors.backgroundGrey,
            inactiveFillColor: AppColors.backgroundGrey,
            activeColor: AppColors.backgroundGrey,
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
