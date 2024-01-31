part of 'image_generator_cubit.dart';

@immutable
abstract class ImageGeneratorState {}

class ImageGeneratorInitial extends ImageGeneratorState {}
class ImageGeneratorLoading extends ImageGeneratorState {}
class ImageGeneratorSuccess extends ImageGeneratorState {
  final String imageGenerator ;

  ImageGeneratorSuccess({required this.imageGenerator});
}
class ImageGeneratorFailure extends ImageGeneratorState {
  final String errorMessage;

  ImageGeneratorFailure({required this.errorMessage});
}
class InstallImage extends ImageGeneratorState {
}

class ClearImageData extends ImageGeneratorState {}

