import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Constants/color.dart';
import '../../../widgets/otp.dart';
import '../../../widgets/pin_code.dart';
import '../../dashboard_screen.dart';

class ConfirmSignScreen extends StatefulWidget {
  const ConfirmSignScreen({super.key});

  @override
  State<ConfirmSignScreen> createState() => _ConfirmSignScreenState();
}

class _ConfirmSignScreenState extends State<ConfirmSignScreen> {
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
              const Text(
                'تایید شماره موبایل',
                style: TextStyle(
                    fontFamily: 'sb', fontSize: 16, color: AppColors.black),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'کد ثبت نام پیامک شده را وارد کنید',
                style: TextStyle(
                  fontFamily: 'sm',
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              // pinCodeBox(context),
              otpForm(context),

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
                    child: const Text(
                      'ارسال مجدد کد',
                      style: TextStyle(
                          fontFamily: 'sm',
                          color: AppColors.grey,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '00:$_start',
                    style: const TextStyle(
                        fontFamily: 'sm',
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ],
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
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'تایید ثبت نام',
                    style: TextStyle(fontFamily: 'sm', fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
