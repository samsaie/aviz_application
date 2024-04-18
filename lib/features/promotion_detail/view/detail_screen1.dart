import 'package:aviz_application/widgets/appBars.dart';
import 'package:flutter/material.dart';
import '../../../widgets/alert_dialogs.dart';
import '../../../widgets/buttons.dart';
import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/cached_network_image.dart';
import '../../home/data/model/promotion.dart';

class DetailScreen extends StatefulWidget {
  final Promotion promotion;
  const DetailScreen(this.promotion, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Promotion promotion;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    widget.promotion;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: DetailAppBar(),
        ),
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 20),
                  sliver: HeaderContent(
                    parentWidget: widget,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  sliver: AvizTabBar(),
                ),
              ];
            },
            body: const TabBarView(
              children: [InfoTab(), PriceTab(), FacilityTab(), ExplainTab()],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  final DetailScreen parentWidget;

  const HeaderContent({
    super.key,
    required this.parentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 32),
          Container(
            color: Colors.white,
            height: 220.0,
            child: Center(
              child: SizedBox(
                  width: double.maxFinite,
                  child: CachedImage(
                    imageUrl: parentWidget.promotion.thumbnailUrl,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 233, 236, 243)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: Text(
                      'آپارتمان',
                      style: appTheme()
                          .textTheme
                          .bodySmall!
                          .apply(color: AppColors.red),
                    ),
                  ),
                ),
              ),
              Text(
                '۱۶ دقیقه پیش در گرگان',
                style: appTheme().textTheme.bodySmall,
              ),
            ],
          ),
          Text(
            parentWidget.promotion.title,
            style: appTheme().textTheme.titleLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1, color: AppColors.grey200),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: alertDialog(context)),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'هشدار های قبل از معامله!',
                      style: appTheme().textTheme.titleLarge,
                    ),
                    Image.asset('assets/images/grey_arrow_left_icon.png'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvizTabBar extends StatelessWidget {
  const AvizTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _StickyTabBarDelegate(
        TabBar(
          indicatorWeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              6.0,
            ),
            color: AppColors.red,
          ),
          labelStyle:
              appTheme().textTheme.bodyMedium!.apply(color: Colors.white),
          unselectedLabelColor: AppColors.red,
          tabs: const [
            Tab(text: 'مشخصات'),
            Tab(text: 'قیمت'),
            Tab(text: 'امکانات'),
            Tab(text: 'توضیحات'),
          ],
        ),
      ),
    );
  }
}

class InfoTab extends StatelessWidget {
  const InfoTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            children: [
              Container(
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey200,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'متراژ',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '۵۰۰',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey700),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: AppColors.grey200,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'اتاق',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '۶',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey700),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromARGB(255, 235, 239, 244),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'طبقه',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'دوبلکس',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey700),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromARGB(255, 235, 239, 244),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ساخت',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '۱۴۰۲',
                          style: appTheme()
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.grey700),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
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
                                Image.asset('assets/images/location_icon.png')
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
              callButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class PriceTab extends StatelessWidget {
  const PriceTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey400,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'قیمت هر متر:',
                            style: appTheme()
                                .textTheme
                                .titleMedium!
                                .apply(color: AppColors.grey700),
                          ),
                          const Spacer(),
                          Text(
                            '۴۶٬۴۶۰٬۰۰۰',
                            style: appTheme()
                                .textTheme
                                .titleMedium!
                                .apply(color: AppColors.grey700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 235, 239, 244),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'قیمت کل:',
                            style: appTheme()
                                .textTheme
                                .titleMedium!
                                .apply(color: AppColors.grey700),
                          ),
                          const Spacer(),
                          Text(
                            '۲۳٬۲۳۰٬۰۰۰٬۰۰۰',
                            style: appTheme()
                                .textTheme
                                .titleMedium!
                                .apply(color: AppColors.grey700),
                          ),
                          const Divider(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              callButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class FacilityTab extends StatelessWidget {
  const FacilityTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> facilities = [
      'آسانسور',
      'پارکینگ',
      'انباری',
      'بالکن',
      'پنت هاوس',
      'جنس کف سرامیک',
      'سرویس بهداشتی فرنگی و ایرانی'
    ];
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/property_icon.png',
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text('ویژگی ها', style: appTheme().textTheme.titleLarge),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 125,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey400,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text('سند', style: appTheme().textTheme.bodyMedium),
                          Spacer(),
                          Text('تک برگ',
                              style: appTheme().textTheme.bodyMedium),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Color.fromARGB(255, 235, 239, 244),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('جهت ساختمان',
                              style: appTheme().textTheme.bodyMedium),
                          Spacer(),
                          Text('شمالی', style: appTheme().textTheme.bodyMedium),
                          Divider(),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/facilities_icon.png',
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'امکانات',
                    style: appTheme().textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                // height: 360,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey400,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                      for (var title in facilities)
                        Text(title, style: appTheme().textTheme.bodyMedium),
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              callButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class ExplainTab extends StatelessWidget {
  const ExplainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Text(
                'ویلا ۵۰۰ متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده  گذاشتم فروش فوری  خریدار باشی تخفیف پای معامله میدم.',
                style: appTheme().textTheme.bodyMedium,
              ),
              SizedBox(
                height: 32,
              ),
              callButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
