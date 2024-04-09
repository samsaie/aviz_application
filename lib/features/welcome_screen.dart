import 'package:flutter/material.dart';

import '../Constants/color.dart';
import 'auth/view/login_screen.dart';
import 'auth/view/signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              _getImageContainer(),
              const SizedBox(
                height: 12,
              ),
              _getContainerBox(),
              const Spacer(),
              _getBottoms(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getImageContainer() {
  return Stack(children: [
    Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          image: AssetImage('assets/images/background_pattern_image.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Image.asset('assets/images/welcome_image.png'),
            ),
          ],
        ),
      ),
    ),
  ]);
}

Widget _getContainerBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'اینجا محل',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 16, color: AppColors.black),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/logo_image.png'),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'آگهی شماست',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 16, color: AppColors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 41),
          child: Text(
            'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
            style: TextStyle(
              fontFamily: 'sm',
              fontSize: 14,
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

Widget _getBottoms(BuildContext context) {
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
