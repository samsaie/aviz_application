import 'package:flutter/material.dart';
import 'color.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: 'sm',
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: 'sm',
        color: AppColors.borderGrey,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'sm',
        color: AppColors.grey,
      ),
    ),
  );
}
