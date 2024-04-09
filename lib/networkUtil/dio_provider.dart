import 'package:dio/dio.dart';

import '../Constants/string_constants.dart';

class DioProvider {
  static Dio createDio() {
    return Dio(BaseOptions(baseUrl: StringConstants.baseUrl));
  }
}
