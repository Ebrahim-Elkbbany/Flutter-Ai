import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai/features/Image_generator_ai/data/repos/image_generator_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

part 'image_generator_state.dart';

class ImageGeneratorCubit extends Cubit<ImageGeneratorState> {
  ImageGeneratorCubit(this.imageGeneratorRepo) : super(ImageGeneratorInitial());
  final ImageGeneratorRepo imageGeneratorRepo;
  TextEditingController promptController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? imageUrl;

  Future<void> imageGenerator({required BuildContext context}) async {
    emit(ImageGeneratorLoading());
    var imageGeneratorResponse =
        await imageGeneratorRepo.imageGenerator(prompt: promptController.text);

    imageGeneratorResponse.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
        emit(ImageGeneratorFailure(errorMessage: failure.errorMessage));
      },
      (imageGeneration) {
        imageUrl = imageGeneration.data[0].url;
        emit(
            ImageGeneratorSuccess(imageGenerator: imageGeneration.data[0].url));
      },
    );
  }

  void clearImageData() {
    promptController.clear();
    imageUrl = null;
    emit(ClearImageData());
  }

  void saveImage(context) async {
    var response = await Dio()
        .get(imageUrl!, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('QR Code saved to Gallery'),
      ),
    );
    emit(InstallImage());
    if (kDebugMode) {
      print(result);
    }
  }
}
