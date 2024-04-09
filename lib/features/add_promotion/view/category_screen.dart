import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../dashboard_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String type;
  final void Function(String) onFinish;

  const CategoryScreen({
    super.key,
    required this.type,
    required this.onFinish,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> categories = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
              child: const Icon(CupertinoIcons.clear),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.right_chevron),
              ),
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_type.png'),
                const Text(
                  'دسته بندی ',
                  style: TextStyle(
                      fontFamily: 'sm', fontSize: 16, color: AppColors.red),
                )
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            sliver: _getCategoriesList(),
          ),
        ],
      ),
    );
  }

  Widget _getCategoriesList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                widget.onFinish(categories[index]);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderGrey,
                    ),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      categories[index],
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: appTheme().textTheme.titleSmall!.fontFamily,
                      ),
                    ),
                    Image.asset('assets/images/red_arrow_left_icon.png')
                  ],
                ),
              ),
            ),
          );
        },
        childCount: categories.length,
      ),
    );
  }
}
