import 'package:dartz/dartz.dart';

import '../../../../networkUtil/api_exception.dart';
import '../dataSource/home_dataSource.dart';
import '../model/promotion.dart';

abstract class IHomeRepository {
  Future<Either<String, List<Promotion>>> getHotPromotion();
  Future<Either<String, List<Promotion>>> getLatestPromotion();
}

class HomeRepository extends IHomeRepository {
  final IHomeDataSource dataSource;

  HomeRepository(this.dataSource);

  @override
  Future<Either<String, List<Promotion>>> getHotPromotion() async {
    try {
      var response = await dataSource.getHotPromotions();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Promotion>>> getLatestPromotion() async {
    try {
      var response = await dataSource.getLatestPromotions();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
