import 'package:flutter/material.dart';

import '../Constants/color.dart';

Widget otpForm(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 80,
          child: TextFormField(
            autofocus: true,
            onSaved: (pin1) {},
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
              fillColor: AppColors.backgroundGrey,
              filled: true,
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'sm', fontSize: 16),
          ),
        ),
        SizedBox(
          height: 50,
          width: 80,
          child: TextFormField(
            autofocus: true,
            onSaved: (pin2) {},
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
                fillColor: AppColors.backgroundGrey,
                filled: true),
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'sm', fontSize: 16),
          ),
        ),
        SizedBox(
          height: 50,
          width: 80,
          child: TextFormField(
            autofocus: true,
            onSaved: (pin3) {},
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
                fillColor: AppColors.backgroundGrey,
                filled: true),
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'sm', fontSize: 16),
          ),
        ),
        SizedBox(
          height: 50,
          width: 80,
          child: TextFormField(
            autofocus: true,
            onSaved: (pin4) {},
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
                fillColor: AppColors.backgroundGrey,
                filled: true),
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'sm', fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
