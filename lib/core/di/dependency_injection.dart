import 'package:dio/dio.dart';
import 'package:flutter_ai/core/network/dio.dart';
import 'package:flutter_ai/features/Image_generator_ai/data/repos/image_generator_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<ImageGeneratorRepoImpl>(ImageGeneratorRepoImpl(
    getIt.get<ApiService>(),
  ));
}
