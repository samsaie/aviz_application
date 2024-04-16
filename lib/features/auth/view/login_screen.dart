import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../Constants/color.dart';
import 'confirm_login_screen.dart';
import 'signIn_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'ورود به',
                      style: TextStyle(
                          fontFamily: 'sb',
                          fontSize: 16,
                          color: AppColors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/logo_image.png'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی!',
                  style: TextStyle(
                    fontFamily: 'sm',
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.backgroundGrey,
                    filled: true,
                    labelText: 'شماره موبایل',
                    labelStyle: TextStyle(
                      fontFamily: 'sm',
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      fontFamily: 'sm',
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
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
                          builder: (context) => const ConfirmLoginScreen(),
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
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'تاحالا ثبت نام نکردی؟',
                      style: const TextStyle(
                          color: AppColors.grey,
                          fontFamily: 'sm',
                          fontSize: 14),
                      children: [
                        TextSpan(
                          text: ' ثبت نام',
                          style: const TextStyle(
                              color: AppColors.red,
                              fontFamily: 'sm',
                              fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
