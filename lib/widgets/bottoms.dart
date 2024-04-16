import '../features/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../Constants/color.dart';
import '../features/auth/view/confirm_screen.dart';
import '../features/auth/view/login_screen.dart';
import '../features/auth/view/signIn_screen.dart';

Widget getBottoms(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 180,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: AppColors.red,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignScreen(),
              ),
            );
          },
          child: const Text(
            'ثبت نام',
            style: TextStyle(fontFamily: 'sm', fontSize: 16),
          ),
        ),
      ),
      const SizedBox(
        width: 25,
      ),
      SizedBox(
        width: 180,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: Colors.white,
            foregroundColor: AppColors.red,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: const Text(
            'ورود',
            style: TextStyle(fontFamily: 'sm', fontSize: 16),
          ),
        ),
      ),
    ],
  );
}

Widget nextBottom(BuildContext context) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: AppColors.red,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ConfirmScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'مرحله بعد',
            style: TextStyle(fontFamily: 'sm', fontSize: 16),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset('assets/images/arrow-left.png')
        ],
      ),
    ),
  );
}

Widget confirmBottom(BuildContext context) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: AppColors.red,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      },
      child: const Text(
        'تایید',
        style: TextStyle(fontFamily: 'sm', fontSize: 16),
      ),
    ),
  );
}