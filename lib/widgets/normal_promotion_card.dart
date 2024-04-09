import 'package:aviz_application/Util/number_extension.dart';
import 'package:flutter/material.dart';

import '../Constants/color.dart';
import '../features/home/data/model/promotion.dart';
import '../features/promotion_detail/view/detail_screen1.dart';
import 'cached_network_image.dart';

class NormalPromotionCard extends StatelessWidget {
  final Promotion promotion;
  const NormalPromotionCard(this.promotion, {super.key});

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
                    child: Text(
                      promotion.title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontFamily: 'sm',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Text(
                      promotion.description,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                        fontFamily: 'sm',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'قیمت:',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontFamily: 'sm',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        promotion.price.convertToPrice(),
                        style: const TextStyle(
                          color: AppColors.red,
                          fontSize: 12,
                          fontFamily: 'sm',
                          fontWeight: FontWeight.w500,
                        ),
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
