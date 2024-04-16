import 'package:aviz_application/Util/number_extension.dart';
import 'package:aviz_application/Constants/color.dart';
import 'package:aviz_application/Constants/theme.dart';
import 'package:aviz_application/widgets/alert_dialogs.dart';
import 'package:aviz_application/widgets/call_buttons.dart';
import 'package:aviz_application/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: AppColors.black,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Information',
                    ),
                    content: const Text(
                      'Info of this Ad',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      Center(
                        child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Ok')),
                      )
                    ],
                  ),
                );
              },
              icon: Image.asset('assets/images/information_icon.png'),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Share',
                    ),
                    content: const Text(
                      'Share this Ad',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      Center(
                        child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Ok')),
                      )
                    ],
                  ),
                );
              },
              icon: Image.asset('assets/images/share_icon.png'),
            ),
            IconButton(
              icon: clicked
                  ? Image.asset(
                      'assets/images/save_icon.png',
                      color: AppColors.red,
                    )
                  : Image.asset('assets/images/save_icon.png'),
              onPressed: () {
                setState(() {
                  clicked = !clicked;
                });
              },
            ),
          ],
          scrolledUnderElevation: 0,
        ),
        body: SafeArea(
          child: CustomScrollView(
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
                              color: AppColors.lightGrey,
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
                          border:
                              Border.all(width: 1, color: AppColors.lightGrey),
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
                                      color: selectedSection == index
                                          ? AppColors.red
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      sectionsList[index],
                                      style: TextStyle(
                                        fontFamily: appTheme()
                                            .textTheme
                                            .titleSmall!
                                            .fontFamily,
                                        fontSize: appTheme()
                                            .textTheme
                                            .titleSmall!
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
          style: appTheme().textTheme.titleSmall,
        ),
        const SizedBox(
          height: 32,
        ),
        const CallButtons()
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
            border: Border.all(color: AppColors.lightGrey, width: 1),
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
                        'سند',
                        style: TextStyle(
                          fontFamily:
                              appTheme().textTheme.titleSmall!.fontFamily,
                          fontSize: 16,
                          color: appTheme().textTheme.titleSmall!.color,
                        ),
                      ),
                      Text(
                        promotion.sanad,
                        style: TextStyle(
                          fontFamily:
                              appTheme().textTheme.titleSmall!.fontFamily,
                          fontSize: 16,
                          color: appTheme().textTheme.titleSmall!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
                thickness: 1,
                color: Color.fromARGB(255, 235, 239, 244),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'جهت ساختمان',
                        style: TextStyle(
                          fontFamily:
                              appTheme().textTheme.titleSmall!.fontFamily,
                          fontSize: 16,
                          color: appTheme().textTheme.titleSmall!.color,
                        ),
                      ),
                      Text(
                        promotion.direction,
                        style: TextStyle(
                          fontFamily:
                              appTheme().textTheme.titleSmall!.fontFamily,
                          fontSize: 16,
                          color: appTheme().textTheme.titleSmall!.color,
                        ),
                      ),
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
            border: Border.all(color: AppColors.lightGrey, width: 1),
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
                    child: Text(
                      facilities[index],
                      style: TextStyle(
                        fontFamily: appTheme().textTheme.titleSmall!.fontFamily,
                        fontSize: 16,
                        color: appTheme().textTheme.titleSmall!.color,
                      ),
                    ),
                  ),
                  index != (facilities.length - 1)
                      ? const Divider(
                          indent: 16,
                          endIndent: 16,
                          thickness: 1,
                          color: Color.fromARGB(255, 235, 239, 244),
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
        const CallButtons()
      ],
    );
  }

  Widget _getPriceSection() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 96,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey, width: 1),
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
                        style: TextStyle(
                          fontFamily:
                              appTheme().textTheme.titleSmall!.fontFamily,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        promotion.pricePerMeter.convertToPrice(),
                        style: TextStyle(
                          fontFamily:
                              appTheme().textTheme.titleSmall!.fontFamily,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
                thickness: 1,
                color: Color.fromARGB(255, 235, 239, 244),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'قیمت کل:',
                      style: TextStyle(
                        fontFamily: appTheme().textTheme.titleSmall!.fontFamily,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      promotion.price.convertToPrice(),
                      style: TextStyle(
                        fontFamily: appTheme().textTheme.titleSmall!.fontFamily,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
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
        const CallButtons()
      ],
    );
  }

  Widget _getInfoSection() {
    return Column(
      children: [
        Container(
          height: 98,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey, width: 1),
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
                      style: appTheme().textTheme.titleSmall,
                    ),
                    Text(
                      promotion.meterage.toString(),
                      style: TextStyle(
                        fontFamily: appTheme().textTheme.titleSmall!.fontFamily,
                        fontSize: appTheme().textTheme.titleSmall!.fontSize,
                        color: AppColors.black,
                      ),
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
                      style: appTheme().textTheme.titleSmall,
                    ),
                    Text(
                      promotion.rooms.toString(),
                      style: TextStyle(
                        fontFamily: appTheme().textTheme.titleSmall!.fontFamily,
                        fontSize: appTheme().textTheme.titleSmall!.fontSize,
                        color: AppColors.black,
                      ),
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
                      style: appTheme().textTheme.titleSmall,
                    ),
                    Text(
                      promotion.floors.toString(),
                      style: TextStyle(
                        fontFamily: appTheme().textTheme.titleSmall!.fontFamily,
                        fontSize: appTheme().textTheme.titleSmall!.fontSize,
                        color: AppColors.black,
                      ),
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
                      style: appTheme().textTheme.titleSmall,
                    ),
                    Text(
                      promotion.buildYear.toString(),
                      style: TextStyle(
                        fontFamily:
                            appTheme().textTheme.titleMedium!.fontFamily,
                        fontSize: appTheme().textTheme.titleMedium!.fontSize,
                        color: AppColors.black,
                      ),
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
                          const Text(
                            'گرگان، صیاد شیرا...',
                            style: TextStyle(
                                fontFamily: 'sm',
                                color: Colors.white,
                                fontSize: 16),
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
        const CallButtons()
      ],
    );
  }
}
