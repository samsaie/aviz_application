import 'dart:async';
import 'package:flutter/material.dart';
import '../../../Constants/color.dart';
import '../../../features/dashboard_screen.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/otp.dart';

class ConfirmScreen extends StatefulWidget {
  final bool isLogin;
  const ConfirmScreen({super.key, required this.isLogin});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late Timer _timer;
  int _start = 45;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'تایید شماره موبایل',
                style: appTheme().textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.isLogin
                    ? "کد ورود پیامک شده را وارد کنید"
                    : "کد ثبت نام پیامک شده را وارد کنید",
                style: appTheme().textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 32,
              ),
              // pinCodeBox(context),
              otpForm(context),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _start = 45;
                        startTimer();
                      });
                    },
                    child: Text(
                      'ارسال مجدد کد',
                      style: appTheme().textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '00:$_start',
                    style: appTheme().textTheme.titleLarge,
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: AppColors.red,
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                  );
                },
                child: Text(
                  widget.isLogin ? 'تایید ورود' : 'تایید ثبت نام',
                  style: appTheme()
                      .textTheme
                      .titleLarge!
                      .apply(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
