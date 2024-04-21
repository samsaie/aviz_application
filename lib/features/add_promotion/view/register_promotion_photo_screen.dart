import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/appBars.dart';
import '../../../widgets/switch.dart';
import '../../dashboard_screen.dart';

class RegisterPromotionPhotoScreen extends StatefulWidget {
  const RegisterPromotionPhotoScreen({super.key});

  @override
  State<RegisterPromotionPhotoScreen> createState() =>
      _RegisterPromotionPhotoScreenState();
}

class _RegisterPromotionPhotoScreenState
    extends State<RegisterPromotionPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AddAppBar(),
      ),
      body: const Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _GetPictureContainer(),
              _GetTitleContainer(),
              _GetExplainContainer(),
              _GetCallSwitches(),
              _NextButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _GetCallSwitches extends StatelessWidget {
  const _GetCallSwitches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: [
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
                    'فعال کردن گفتگو',
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
          SizedBox(
            height: 16,
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
                    'فعال کردن تماس',
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
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: appTheme().elevatedButtonTheme.style,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          },
          child: Text(
            'ثبت آگهی',
            style: appTheme().textTheme.titleMedium!.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _GetTitleContainer extends StatelessWidget {
  const _GetTitleContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/title_icon.png',
              ),
              const SizedBox(
                width: 6,
              ),
              Text('عنوان آویز', style: appTheme().textTheme.titleLarge),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.grey300),
                ),
                width: double.infinity,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.grey300,
                    filled: true,
                    hintText: 'عنوان آویز را وارد کنید',
                    hintStyle: appTheme()
                        .textTheme
                        .titleMedium!
                        .apply(color: AppColors.grey400),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _GetExplainContainer extends StatelessWidget {
  const _GetExplainContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/explain_icon.png',
              ),
              const SizedBox(
                width: 6,
              ),
              Text('توضیحات', style: appTheme().textTheme.titleLarge),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.grey300),
                ),
                width: double.infinity,
                height: 120,
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.grey300,
                    filled: true,
                    hintText: 'توضیحات آویز را وارد کنید ...',
                    hintStyle: appTheme()
                        .textTheme
                        .titleMedium!
                        .apply(color: AppColors.grey400),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _GetPictureContainer extends StatelessWidget {
  const _GetPictureContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: SizedBox(
        height: 212,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/camera_icon.png',
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'تصویر آویز',
                  style: appTheme().textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Stack(
              children: [
                DottedBorder(
                  dashPattern: const [
                    6,
                    6,
                  ],
                  color: AppColors.grey400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 160,
                    ),
                  ),
                ),
                Positioned(
                  right: 80,
                  bottom: 40,
                  child: Column(
                    children: [
                      Text(
                        'لطفا تصویر آویز خود را بارگذاری کنید',
                        style: appTheme().textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.red),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/upload_icon.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'انتخاب تصویر',
                              style: appTheme()
                                  .textTheme
                                  .titleLarge!
                                  .apply(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
