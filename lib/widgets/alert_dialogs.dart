import 'package:flutter/material.dart';

Widget alertDialog(context) {
  return AlertDialog(
    title: const Text(
      'روش‌های رایج کلاهبرداری در املاک:',
      style: TextStyle(fontFamily: 'sb', fontSize: 16),
    ),
    content: const Text(
      '1- دریافت بیعانه 2- دریافت پول به بهانهٔ ارسال عکس و بازدید  3- اجاره یا فروش همزمان ملک به چند نفر  4- اجاره یا فروش ملک با سند یا شرایط مشکل‌دار  -  در این موارد به شدت احتیاط کنید:  آگهی‌گذار درخواست بیعانه دارد -  قیمت ملک پایین و وسوسه‌کننده‌ است - آگهی‌گذار به جای چت آویز مکالمه در خارج آویز را پیشنهاد می‌کند - وضعیت سند مشخص نیست',
      textAlign: TextAlign.start,
    ),
    actions: [
      Center(
        child: TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Ok')),
      )
    ],
  );
}
