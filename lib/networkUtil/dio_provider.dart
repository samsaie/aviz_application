import 'package:dio/dio.dart';
import '../Constants/string_constants.dart';

class DioProvider {
  static Dio createDio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: StringConstants.baseUrl,
    ));
    return dio;
  }

  static Dio createDioWithoutHeader() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: StringConstants.baseUrl,
      ),
    );

    return dio;
  }
}
