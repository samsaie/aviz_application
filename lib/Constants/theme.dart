import 'package:flutter/material.dart';
import 'color.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      titleLarge:
          TextStyle(fontFamily: 'sb', fontSize: 16, color: AppColors.black),
      bodyMedium: TextStyle(
        fontFamily: 'sm',
        fontSize: 14,
        color: AppColors.grey,
      ),
      bodySmall: TextStyle(
        color: AppColors.grey,
        fontSize: 12,
        fontFamily: 'sm',
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
