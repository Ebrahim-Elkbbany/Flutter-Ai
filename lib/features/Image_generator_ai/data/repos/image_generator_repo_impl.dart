import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ai/core/errors/failures.dart';
import 'package:flutter_ai/core/network/dio.dart';
import 'package:flutter_ai/core/network/end_points.dart';
import 'package:flutter_ai/features/Image_generator_ai/data/models/image_generator_model.dart';
import 'package:flutter_ai/features/Image_generator_ai/data/repos/image_generator_repo.dart';

class ImageGeneratorRepoImpl implements ImageGeneratorRepo {
  ApiService apiService;

  ImageGeneratorRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ImageGeneratorModel>> imageGenerator(
      {required String prompt}) async{
    try {
      var response =
          await apiService.post(urlEndPoint: EndPoints.imageGeneration, data: {
        'prompt': prompt,
        'size': '1024x1024',
      });
      ImageGeneratorModel imageGeneratorModel = ImageGeneratorModel.fromJson(response);
      return right(imageGeneratorModel);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
