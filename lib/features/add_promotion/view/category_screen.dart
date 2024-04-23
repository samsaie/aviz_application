import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/appBars.dart';
import '../../add_promotion/view/sub_category_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
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
      child: Scaffold(
        appBar: AppBar(
          title: const CategoryAppBar(),
          bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: LinearPercentIndicator(
              lineHeight: 10.0,
              percent: 0.9,
              progressColor: Colors.white,
              backgroundColor: Colors.red,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: _getCategoriesList(),
        ),
      ),
    );
  }

  Widget _getCategoriesList() {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SubCategoryScreen(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey400,
                ),
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text(categories[index],
                    textAlign: TextAlign.end,
                    style: appTheme()
                        .textTheme
                        .bodyMedium!
                        .apply(color: AppColors.grey700)),
                Image.asset('assets/images/red_arrow_left_icon.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
