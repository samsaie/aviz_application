import 'package:flutter/material.dart';

import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_type.png'),
            Text(
              'من',
              style: TextStyle(
                fontFamily: appTheme().textTheme.titleMedium!.fontFamily,
                fontSize: 18,
                color: AppColors.red,
              ),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      cursorColor: AppColors.grey,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        suffixIcon:
                            Image.asset('assets/images/search_icon.png'),
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'جستجو...',
                        hintStyle: appTheme().textTheme.titleMedium,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: AppColors.backgroundGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset(
                          'assets/images/profile.png',
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'حساب کاربری',
                          textAlign: TextAlign.end,
                          style: appTheme().textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 95,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.backgroundGrey, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Vector.png',
                            scale: 4,
                          ),
                          Column(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'سید محمد جواد هاشمی',
                                style: TextStyle(
                                  fontFamily: appTheme()
                                      .textTheme
                                      .titleSmall!
                                      .fontFamily,
                                  fontSize:
                                      appTheme().textTheme.titleSmall!.fontSize,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    '09117540145',
                                    style: TextStyle(
                                      fontFamily: appTheme()
                                          .textTheme
                                          .titleSmall!
                                          .fontFamily,
                                      fontSize: appTheme()
                                          .textTheme
                                          .titleSmall!
                                          .fontSize,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'تایید شده',
                                      style: TextStyle(
                                        fontFamily: appTheme()
                                            .textTheme
                                            .titleMedium!
                                            .fontFamily,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 16),
                              Image.asset(
                                  'assets/images/edit_profile_icon.png'),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Divider(
                        color: AppColors.backgroundGrey, thickness: 1),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: ContentList(),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Column(
                      children: [
                        Text(
                          'نسخه',
                          style: TextStyle(
                            fontWeight:
                                appTheme().textTheme.titleSmall!.fontWeight,
                            fontSize: appTheme().textTheme.titleSmall!.fontSize,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          '1.5.9',
                          style: TextStyle(
                            fontWeight:
                                appTheme().textTheme.titleSmall!.fontWeight,
                            fontSize: appTheme().textTheme.titleSmall!.fontSize,
                            color: AppColors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContentList extends StatelessWidget {
  final List items = [
    ['آگهی های من', 'my_aviz_icon'],
    ['پرداخت های من', 'card_icon'],
    ['بازدید های اخیر', 'view_icon'],
    ['ذخیره شده ها', 'save_2_icon'],
    ['تنظیمات', 'setting_2_icon'],
    ['پشتیبانی و قوانین', 'support_icon'],
    ['درباره آویز', 'info-circle'],
  ];
  ContentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/${items[index][1]}.png'),
                        const SizedBox(width: 12),
                        Text(
                          items[index][0],
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily:
                                appTheme().textTheme.titleMedium!.fontFamily,
                            fontSize:
                                appTheme().textTheme.titleMedium!.fontSize,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    const ImageIcon(
                      AssetImage('assets/images/arrow-left.png'),
                      color: AppColors.grey,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        childCount: items.length,
      ),
    );
  }
}
