import 'package:aviz_application/widgets/buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../Constants/color.dart';

import '../../../Constants/theme.dart';
import 'login_screen.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

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
                    Text(
                      'خوش اومدی به',
                      style: appTheme().textTheme.titleLarge,
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
                Text(
                  'این فوق العادست که آویزو برای آگهی هات انتخاب کردی!',
                  style: appTheme().textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.backgroundGrey,
                    filled: true,
                    labelText: 'نام و نام خانوادگی',
                    labelStyle: appTheme()
                        .textTheme
                        .titleLarge!
                        .apply(color: AppColors.lightGrey),
                    floatingLabelStyle: appTheme()
                        .textTheme
                        .titleLarge!
                        .apply(color: AppColors.lightGrey),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.backgroundGrey,
                    filled: true,
                    labelText: 'شماره موبایل',
                    labelStyle: appTheme()
                        .textTheme
                        .titleLarge!
                        .apply(color: AppColors.lightGrey),
                    floatingLabelStyle: appTheme()
                        .textTheme
                        .titleLarge!
                        .apply(color: AppColors.lightGrey),
                  ),
                ),
                const Spacer(),
                nextButton(context),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'قبلا ثبت نام کردی؟',
                      style: appTheme().textTheme.bodyMedium!,
                      children: [
                        TextSpan(
                          text: ' ورود',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.red),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
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
