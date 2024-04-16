import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Constants/color.dart';
import '../widgets/bottoms.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 600,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: 3,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _getImageContainer(),
                        const SizedBox(
                          height: 12,
                        ),
                        _getContainerBox(),
                      ],
                    );
                  },
                ),
              ),
              const Spacer(),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                textDirection: TextDirection.rtl,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: AppColors.grey,
                  activeDotColor: AppColors.red,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              getBottoms(context)
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
  return Column(
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
        padding: EdgeInsets.symmetric(horizontal: 20),
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
  );
}
