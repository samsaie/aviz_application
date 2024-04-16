import 'package:flutter/material.dart';
import 'cached_network_image.dart';
import '../Util/number_extension.dart';
import '../Constants/color.dart';
import '../features/home/data/model/promotion.dart';
import '../features/promotion_detail/view/detail_screen2.dart';

class HotPromotionCard extends StatelessWidget {
  final Promotion promotion;
  const HotPromotionCard(this.promotion, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreenn(promotion: promotion),
          ),
        );
      },
      child: Container(
        height: 267,
        width: 224,
        clipBehavior: Clip.antiAlias,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 192,
              height: 110,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: CachedImage(
                imageUrl: promotion.thumbnailUrl,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 16),
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
            const Spacer(),
            Row(
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
    );
  }
}
