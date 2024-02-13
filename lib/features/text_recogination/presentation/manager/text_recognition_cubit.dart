import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'text_recognition_state.dart';

class TextRecognitionCubit extends Cubit<TextRecognitionState> {
  TextRecognitionCubit() : super(TextRecognitionInitial());
  File? image;
  String ?responseText;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      emit(PickImageSuccess());
    } on PlatformException catch(e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }
  Future textRecognition(File file) async {
    try {

      final recognizer =TextRecognizer(script: TextRecognitionScript.latin);
       final image =  InputImage.fromFile(file);
        final recognized = await recognizer.processImage(image);
       responseText = recognized.text;
      emit(ExportTextSuccess());
    } on PlatformException catch(e) {
      if (kDebugMode) {
        print('Failed to pick text: $e');
      }
    }
  }
}
