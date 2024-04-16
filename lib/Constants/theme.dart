import 'package:flutter/material.dart';
import 'color.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      titleLarge:
          TextStyle(fontFamily: 'sb', fontSize: 16, color: AppColors.black),
      titleMedium: TextStyle(
        fontFamily: 'sm',
        fontSize: 14,
        color: AppColors.grey,
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
