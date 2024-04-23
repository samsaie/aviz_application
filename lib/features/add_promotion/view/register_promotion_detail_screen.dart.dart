import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../widgets/buttons.dart';
import '../../../Constants/color.dart';
import '../../../widgets/appBars.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/switch.dart';

class RegisterPromotionDetailScreen extends StatefulWidget {
  const RegisterPromotionDetailScreen({super.key});

  @override
  State<RegisterPromotionDetailScreen> createState() =>
      _RegisterPromotionDetailScreenState();
}

class _RegisterPromotionDetailScreenState
    extends State<RegisterPromotionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AddAppBar(),
        bottom: PreferredSize(
          preferredSize: const Size(0, 0),
          child: LinearPercentIndicator(
            lineHeight: 10.0,
            percent: 0.5,
            progressColor: Colors.white,
            backgroundColor: Colors.red,
          ),
        ),
      ),
      body: const Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _GetSelectCategoryContainer(),
              Divider(
                endIndent: 20,
                indent: 20,
                color: AppColors.grey200,
              ),
              _GetPropertyContainer(),
              Divider(
                endIndent: 20,
                indent: 20,
                color: AppColors.grey200,
              ),
              _GetFacilityContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class _GetSelectCategoryContainer extends StatefulWidget {
  const _GetSelectCategoryContainer();

  @override
  State<_GetSelectCategoryContainer> createState() =>
      _GetSelectCategoryContainerState();
}

class _GetSelectCategoryContainerState
    extends State<_GetSelectCategoryContainer> {
  var categories = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
    'اجاره آپارتمان',
    'اجاره خانه و ویلا',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز',
  ];

  String selectedCat = 'فروش آپارتمان';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/category_icon.png',
              ),
              const SizedBox(
                width: 6,
              ),
              Text('انتخاب دسته بندی آویز',
                  style: appTheme().textTheme.titleLarge),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('دسته بندی', style: appTheme().textTheme.bodyMedium),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    width: 180,
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.only(left: 12, right: 6),
                      isExpanded: true,
                      menuMaxHeight: 250,
                      value: selectedCat,
                      icon: Image.asset(
                        'assets/images/arrow_down_icon.png',
                        scale: 1.2,
                      ),
                      elevation: 8,
                      borderRadius: BorderRadius.circular(6),
                      underline: Container(),
                      onChanged: (value) {
                        setState(() {
                          selectedCat = value!;
                        });
                      },
                      items: List.generate(
                        categories.length,
                        (index) => DropdownMenuItem(
                          value: categories[index],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index],
                              style: appTheme().textTheme.titleMedium!.apply(
                                    color: AppColors.grey700,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('محدوده ملک', style: appTheme().textTheme.bodyMedium),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    width: 180,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: AppColors.grey300,
                        filled: true,
                        hintText: 'خیابان صیاد شیرازی',
                        hintStyle: appTheme()
                            .textTheme
                            .titleMedium!
                            .apply(color: AppColors.grey400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _GetPropertyContainer extends StatefulWidget {
  const _GetPropertyContainer();

  @override
  State<_GetPropertyContainer> createState() => _GetPropertyContainerState();
}

class _GetPropertyContainerState extends State<_GetPropertyContainer> {
  var numbers = [
    '۱',
    '۲',
    '۳',
    '۴',
    '۵',
    '۶',
    '۷',
    '۸',
  ];

  var year = [
    '۱۴۰۳',
    '۱۴۰۲',
    '۱۴۰۱',
    '۱۴۰۰',
    '۱۳۹۹',
    '۱۳۹۸',
    '۱۳۹۷',
    '۱۳۹۶',
  ];

  String selectedNumber = '۱';

  String selectedYear = '۱۴۰۳';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
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
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('متراژ', style: appTheme().textTheme.bodyMedium),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    width: 180,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: AppColors.grey300,
                        filled: true,
                        hintText: 'متراژ',
                        hintStyle: appTheme()
                            .textTheme
                            .titleMedium!
                            .apply(color: AppColors.grey400),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('تعداد اتاق', style: appTheme().textTheme.bodyMedium),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    width: 180,
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.only(left: 12, right: 6),
                      isExpanded: true,
                      menuMaxHeight: 250,
                      value: selectedNumber,
                      icon: Image.asset(
                        'assets/images/scroll_icon.png',
                      ),
                      elevation: 8,
                      borderRadius: BorderRadius.circular(6),
                      underline: Container(),
                      onChanged: (value) {
                        setState(() {
                          selectedNumber = value!;
                        });
                      },
                      items: List.generate(
                        numbers.length,
                        (index) => DropdownMenuItem(
                          value: numbers[index],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              numbers[index],
                              style: appTheme().textTheme.titleMedium!.apply(
                                    color: AppColors.grey700,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('طبقه', style: appTheme().textTheme.bodyMedium),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    width: 180,
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.only(left: 12, right: 6),
                      isExpanded: true,
                      menuMaxHeight: 250,
                      value: selectedNumber,
                      icon: Image.asset(
                        'assets/images/scroll_icon.png',
                      ),
                      elevation: 8,
                      borderRadius: BorderRadius.circular(6),
                      underline: Container(),
                      onChanged: (value) {
                        setState(() {
                          selectedNumber = value!;
                        });
                      },
                      items: List.generate(
                        numbers.length,
                        (index) => DropdownMenuItem(
                          value: numbers[index],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              numbers[index],
                              style: appTheme().textTheme.titleMedium!.apply(
                                    color: AppColors.grey700,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('سال ساخت', style: appTheme().textTheme.bodyMedium),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    width: 180,
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.only(left: 12, right: 6),
                      isExpanded: true,
                      menuMaxHeight: 250,
                      value: selectedYear,
                      icon: Image.asset(
                        'assets/images/scroll_icon.png',
                      ),
                      elevation: 8,
                      borderRadius: BorderRadius.circular(6),
                      underline: Container(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value!;
                        });
                      },
                      items: List.generate(
                        year.length,
                        (index) => DropdownMenuItem(
                          value: year[index],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              year[index],
                              style: appTheme().textTheme.titleMedium!.apply(
                                    color: AppColors.grey700,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _GetFacilityContainer extends StatelessWidget {
  const _GetFacilityContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/facilities_icon.png',
              ),
              const SizedBox(
                width: 6,
              ),
              Text('امکانات', style: appTheme().textTheme.titleLarge),
            ],
          ),
          const SizedBox(
            height: 24,
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
                    'آسانسور',
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
          const SizedBox(
            height: 27,
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
                    'پارکینگ',
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
          const SizedBox(
            height: 27,
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
                    'انباری',
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
          const SizedBox(
            height: 27,
          ),
          next2Button(context)
        ],
      ),
    );
  }
}
