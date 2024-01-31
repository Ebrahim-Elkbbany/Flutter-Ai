import 'package:dartz/dartz.dart';
import 'package:flutter_ai/core/errors/failures.dart';
import 'package:flutter_ai/features/Image_generator_ai/data/models/image_generator_model.dart';

abstract class ImageGeneratorRepo {
  Future<Either<Failure, ImageGeneratorModel>> imageGenerator({
    required String prompt,
  });
}