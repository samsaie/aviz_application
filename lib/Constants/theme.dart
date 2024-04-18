import 'package:flutter/material.dart';
import 'color.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'sb',
          fontSize: 16,
          color: AppColors.grey700,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          fontFamily: 'sm',
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          fontFamily: 'sb',
          fontSize: 14,
          color: AppColors.grey700,
          fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(
          fontFamily: 'sm',
          fontSize: 18,
          color: AppColors.grey700,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontFamily: 'sm',
          fontSize: 14,
          color: AppColors.grey500,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontFamily: 'sm',
          fontSize: 12,
          color: AppColors.grey500,
          fontWeight: FontWeight.w500),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: Colors.white,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        surfaceTintColor: Colors.transparent,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        surfaceTintColor: Colors.transparent,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        surfaceTintColor: Colors.transparent,
      ),
    ),
  );
}
