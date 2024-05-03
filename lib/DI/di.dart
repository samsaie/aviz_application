import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/home/data/dataSource/home_dataSource.dart';
import '../features/home/data/repository/home_repository.dart';
import '../networkUtil/dio_provider.dart';

var locator = GetIt.instance;

Future<void> getInInit() async {
  locator.registerSingleton<Dio>(DioProvider.createDio());
  locator.registerFactory<IHomeDataSource>(
    () => HomeRemoteDataSource.homeRemoteDataSource(
      locator.get(),
    ),
  );
  locator.registerFactory<IHomeRepository>(
    () => HomeRepository(
      locator.get(),
    ),
  );
}
