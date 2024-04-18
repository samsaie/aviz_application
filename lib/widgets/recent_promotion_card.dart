import 'package:aviz_application/Util/number_extension.dart';
import 'package:flutter/material.dart';

import '../Constants/color.dart';
import '../Constants/theme.dart';
import '../features/home/data/model/promotion.dart';
import '../features/promotion_detail/view/detail_screen1.dart';
import 'cached_network_image.dart';

class RecentPromotionCard extends StatelessWidget {
  final Promotion promotion;
  const RecentPromotionCard(this.promotion, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(promotion),
          ),
        );
      },
      child: Container(
        height: 139,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          shadows: const [
            BoxShadow(
              color: Color.fromARGB(255, 218, 218, 218),
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                10,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: CachedImage(
                imageUrl: promotion.thumbnailUrl,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(promotion.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: appTheme().textTheme.titleSmall),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Text(promotion.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.right,
                        style: appTheme().textTheme.bodySmall),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'قیمت:',
                        textAlign: TextAlign.right,
                        style: appTheme()
                            .textTheme
                            .bodySmall!
                            .apply(color: AppColors.grey700),
                      ),
                      const Spacer(),
                      Text(
                        promotion.price.convertToPrice(),
                        style: appTheme()
                            .textTheme
                            .bodySmall!
                            .apply(color: AppColors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
