import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/buttons.dart';
import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../../features/auth/view/signIn_screen.dart';
import '../../../features/auth/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(), child: const ViewContainer());
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
  });

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
                      'ورود به',
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
                  'خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی!',
                  style: appTheme().textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.grey300,
                    filled: true,
                    hintText: 'شماره موبایل',
                    hintStyle: appTheme()
                        .textTheme
                        .titleMedium!
                        .apply(color: AppColors.grey400),
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
                      text: 'تاحالا ثبت نام نکردی؟',
                      style: appTheme().textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: ' ثبت نام',
                          style: appTheme().textTheme.bodyMedium!.apply(
                                color: AppColors.red,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
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
