import 'package:flutter/material.dart';
import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/appBars.dart';
import '../../../widgets/switch.dart';
import 'register_promotion_photo_screen.dart';

class RegisterPromotionLocationScreen extends StatefulWidget {
  const RegisterPromotionLocationScreen({super.key});

  @override
  State<RegisterPromotionLocationScreen> createState() =>
      _RegisterPromotionLocationScreenState();
}

class _RegisterPromotionLocationScreenState
    extends State<RegisterPromotionLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AddAppBar(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/map_icon.png',
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'موقعیت مکانی',
                          style: appTheme().textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.',
                      style: appTheme().textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 150,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/map_image.png',
                            width: 500,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            top: 55,
                            right: 100,
                            child: Stack(
                              children: [
                                Container(
                                  height: 40,
                                  width: 190,
                                  decoration: const BoxDecoration(
                                    color: AppColors.red,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 15,
                                  child: Row(
                                    children: [
                                      Text(
                                        'گرگان، صیاد شیرا...',
                                        style: appTheme()
                                            .textTheme
                                            .titleLarge!
                                            .apply(color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                          'assets/images/location_icon.png'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.grey300),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              'موقعیت دقیق نقشه نمایش داده شود؟',
                              style: appTheme().textTheme.titleMedium!.apply(
                                    color: AppColors.grey700,
                                  ),
                            ),
                            const Spacer(),
                            const SwitchIcon()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: appTheme().elevatedButtonTheme.style,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const RegisterPromotionPhotoScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'بعدی',
                    style: appTheme()
                        .textTheme
                        .titleMedium!
                        .apply(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
