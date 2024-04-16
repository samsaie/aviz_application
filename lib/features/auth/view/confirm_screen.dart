import 'dart:async';

import 'package:aviz_application/Constants/theme.dart';
import 'package:aviz_application/widgets/bottoms.dart';
import 'package:aviz_application/widgets/pin_code.dart';
import 'package:flutter/material.dart';

import '../../../Constants/color.dart';
import '../../dashboard_screen.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

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
                'کد ورود پیامک شده را وارد کنید',
                style: appTheme().textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 32,
              ),
              pinCodeBox(context),
              //  otpForm(context),

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
              confirmBottom(context),
            ],
          ),
        ),
      ),
    );
  }
}
