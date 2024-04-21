import 'package:aviz_application/features/add_promotion/view/register_promotion_detail_screen.dart.dart';
import 'package:flutter/material.dart';
import '../../../Constants/color.dart';
import '../../../Constants/theme.dart';
import '../../../widgets/appBars.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({
    super.key,
  });

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  List<String> categories = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const categoryAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: _getCategoriesList(),
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
                builder: (context) => const RegisterPromotionDetailScreen(),
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
