import '../../Constants/theme.dart';

import '../features/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../Constants/color.dart';
import '../features/auth/view/confirm_screen.dart';
import '../features/auth/view/login_screen.dart';
import '../features/auth/view/signIn_screen.dart';

Widget getButtons(BuildContext context) {
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
          child: Text(
            'ثبت نام',
            style: appTheme().textTheme.titleMedium!.apply(color: Colors.white),
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
          child: Text(
            'ورود',
            style: appTheme().textTheme.titleMedium!.apply(color: Colors.red),
          ),
        ),
      ),
    ],
  );
}

Widget nextButton(BuildContext context) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ConfirmScreen(isLogin: true),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'مرحله بعد',
            style: appTheme().textTheme.titleMedium!.apply(color: Colors.white),
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

Widget next2Button() {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: ElevatedButton(
      style: appTheme().elevatedButtonTheme.style,
      onPressed: () {},
      child: Text(
        'بعدی',
        style: appTheme().textTheme.titleMedium!.apply(color: Colors.white),
      ),
    ),
  );
}

class ConfirmButton extends StatelessWidget {
  final bool isLogin;
  const ConfirmButton(this.isLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          );
        },
        child: Text(
          isLogin ? 'تایید ورود' : 'تایید ثبت نام',
          style: appTheme().textTheme.titleLarge!.apply(color: Colors.white),
        ),
      ),
    );
  }
}

Widget callButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: 50,
        width: 180,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/message_icon.png'),
              const SizedBox(
                width: 10,
              ),
              Text(
                'گفتگو',
                style:
                    appTheme().textTheme.titleLarge!.apply(color: Colors.white),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: 180,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/call_icon.png'),
              const SizedBox(
                width: 10,
              ),
              Text(
                'اطلاعات تماس',
                style:
                    appTheme().textTheme.titleLarge!.apply(color: Colors.white),
              )
            ],
          ),
        ),
      )
    ],
  );
}
