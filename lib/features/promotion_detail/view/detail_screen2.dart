import 'package:aviz_application/widgets/appBars.dart';
import 'package:flutter/material.dart';
import '../../../Util/number_extension.dart';
import '../../../widgets/buttons.dart';
import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/alert_dialogs.dart';
import '../../../widgets/cached_network_image.dart';
import '../../home/data/model/promotion.dart';

class DetailScreenn extends StatefulWidget {
  final Promotion promotion;

  DetailScreenn({super.key, required this.promotion});

  @override
  State<DetailScreenn> createState() => _DetailScreennState();
}

class _DetailScreennState extends State<DetailScreenn> {
  late final Promotion promotion;
  bool clicked = false;
  var sectionsList = [
    'مشخصات',
    'قیمت',
    'ویژگی ها و امکانات',
    'توضیحات',
  ];
  int selectedSection = 0;

  @override
  void initState() {
    super.initState();
    promotion = widget.promotion;
  }

  bool isArchived = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: DetailAppBar(),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      color: Colors.white,
                      height: 220.0,
                      child: Center(
                        child: SizedBox(
                            width: double.maxFinite,
                            child: CachedImage(
                              imageUrl: promotion.thumbnailUrl,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.grey300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'آپارتمان',
                            style: appTheme()
                                .textTheme
                                .bodySmall!
                                .apply(color: AppColors.red),
                          ),
                        ),
                        Text(
                          '۱۶ دقیقه پیش در گرگان',
                          style: appTheme().textTheme.bodySmall,
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          promotion.title,
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.rtl,
                          style: appTheme().textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 64),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 1, color: AppColors.grey400),
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
                                style: appTheme()
                                    .textTheme
                                    .titleMedium!
                                    .apply(color: AppColors.grey700),
                              ),
                              Image.asset(
                                  'assets/images/grey_arrow_left_icon.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 29,
                      child: ListView.builder(
                        itemCount: sectionsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSection = index;
                                  });
                                },
                                child: Container(
                                  height: 29,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selectedSection == index
                                            ? AppColors.red
                                            : AppColors.grey200),
                                    color: selectedSection == index
                                        ? AppColors.red
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  child: Text(
                                    sectionsList[index],
                                    style: TextStyle(
                                      fontFamily: appTheme()
                                          .textTheme
                                          .bodyMedium!
                                          .fontFamily,
                                      fontSize: appTheme()
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize,
                                      color: selectedSection == index
                                          ? Colors.white
                                          : AppColors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 26),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    _getSectionPage(selectedSection),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSectionPage(int index) {
    switch (index) {
      case 0:
        return _getInfoSection();
      case 1:
        return _getPriceSection();
      case 2:
        return _getFeaturesSection();
      case 3:
        return _getDescriptionSection();
      default:
        return _getInfoSection();
    }
  }

  Widget _getDescriptionSection() {
    return Column(
      children: [
        Text(
          promotion.moreInfo,
          style: appTheme().textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        callButtons()
      ],
    );
  }

  Widget _getFeaturesSection() {
    List<String> facilities = [
      'آسانسور',
      'پارکینگ',
      'انباری',
      'بالکن',
      'پنت هاوس',
      'جنس کف سرامیک',
      'سرویس بهداشتی فرنگی و ایرانی'
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Image.asset(
              'assets/images/property_icon.png',
            ),
            const SizedBox(width: 8),
            Text(
              'ویژگی ها',
              textAlign: TextAlign.end,
              style: appTheme().textTheme.titleLarge,
            )
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 96,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey300, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('سند',
                          style: appTheme()
                              .textTheme
                              .titleMedium!
                              .apply(color: AppColors.grey500)),
                      Text(promotion.sanad,
                          style: appTheme()
                              .textTheme
                              .titleMedium!
                              .apply(color: AppColors.grey500)),
                    ],
                  ),
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
                thickness: 1,
                color: AppColors.grey200,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('جهت ساختمان',
                          style: appTheme()
                              .textTheme
                              .titleMedium!
                              .apply(color: AppColors.grey500)),
                      Text(promotion.direction,
                          style: appTheme()
                              .textTheme
                              .titleMedium!
                              .apply(color: AppColors.grey500)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Image.asset(
              'assets/images/facilities_icon.png',
            ),
            const SizedBox(width: 8),
            Text(
              'امکانات',
              textAlign: TextAlign.end,
              style: appTheme().textTheme.titleLarge,
            )
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 56 * facilities.length.toDouble(),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey300, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ListView.builder(
            itemCount: facilities.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(facilities[index],
                        style: appTheme()
                            .textTheme
                            .titleMedium!
                            .apply(color: AppColors.grey500)),
                  ),
                  index != (facilities.length - 1)
                      ? const Divider(
                          indent: 16,
                          endIndent: 16,
                          thickness: 1,
                          color: AppColors.grey200,
                        )
                      : Container(),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        callButtons()
      ],
    );
  }

  Widget _getPriceSection() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey300, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'قیمت هر متر:',
                        style: appTheme()
                            .textTheme
                            .titleMedium!
                            .apply(color: AppColors.grey700),
                      ),
                      Text(
                        promotion.pricePerMeter.convertToPrice(),
                        style: appTheme()
                            .textTheme
                            .titleMedium!
                            .apply(color: AppColors.grey700),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
                thickness: 1,
                color: AppColors.grey200,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'قیمت کل:',
                      style: appTheme()
                          .textTheme
                          .titleMedium!
                          .apply(color: AppColors.grey700),
                    ),
                    Text(
                      promotion.price.convertToPrice(),
                      style: appTheme()
                          .textTheme
                          .titleMedium!
                          .apply(color: AppColors.grey700),
                    ),
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
    );
  }

  Widget _getInfoSection() {
    return Column(
      children: [
        Container(
          height: 98,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey400, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'متراژ',
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey500),
                    ),
                    Text(
                      promotion.meterage.toString(),
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey700),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 235, 239, 244),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'اتاق',
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey500),
                    ),
                    Text(
                      promotion.rooms.toString(),
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey700),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 235, 239, 244),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'طبقه',
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey500),
                    ),
                    Text(
                      promotion.floors.toString(),
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey700),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 235, 239, 244),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ساخت',
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey500),
                    ),
                    Text(
                      promotion.buildYear.toString(),
                      style: appTheme()
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.grey700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Image.asset(
              'assets/images/map_icon.png',
            ),
            const SizedBox(width: 8),
            Text(
              'موقعیت مکانی',
              textAlign: TextAlign.end,
              style: appTheme().textTheme.titleLarge,
            )
          ],
        ),
        const SizedBox(height: 24),
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
    );
  }
}
