import 'package:dio/dio.dart';
import '../../../../networkUtil/api_exception.dart';
import '../model/promotion.dart';

abstract class IHomeDataSource {
  Future<List<Promotion>> getHotPromotions();
  Future<List<Promotion>> getLatestPromotions();
}

class HomeRemoteDataSource extends IHomeDataSource {
  final Dio _dio;

  HomeRemoteDataSource.homeRemoteDataSource(this._dio);

  @override
  Future<List<Promotion>> getHotPromotions() async {
    try {
      Map<String, dynamic> promotionQuery = {'filter': 'is_hot=true'};
      var response = await _dio.get('collections/promotion/records',
          queryParameters: promotionQuery);
      return response.data['items']
          .map<Promotion>((jsonObject) => Promotion.fromJson(jsonObject))
          .toList();
    } on DioException catch (dioException) {
      throw ApiException(
          dioException.response?.statusCode ?? 0, dioException.message);
    } catch (ex) {
      throw ApiException(0, 'unknown');
    }
  }

  @override
  Future<List<Promotion>> getLatestPromotions() async {
    try {
      Map<String, dynamic> promotionQuery = {'filter': 'is_hot=false'};
      var response = await _dio.get('collections/promotion/records',
          queryParameters: promotionQuery);
      return response.data['items']
          .map<Promotion>((jsonObject) => Promotion.fromJson(jsonObject))
          .toList();
    } on DioException catch (dioException) {
      throw ApiException(
          dioException.response?.statusCode ?? 0, dioException.message);
    } catch (ex) {
      throw ApiException(0, 'unknown');
    }
  }
}
