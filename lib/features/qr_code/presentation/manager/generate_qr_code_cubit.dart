import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

part 'generate_qr_code_state.dart';

class GenerateQrCodeCubit extends Cubit<GenerateQrCodeState> {
  GenerateQrCodeCubit() : super(GenerateQrCodeSuccess());
  TextEditingController controller = TextEditingController();
  String ?qrCodeText;
  GlobalKey globalKey = GlobalKey();
  void clearImageData() {
    controller.clear();
    emit(ClearImageData());
  }

  void convertTextToQrCode(){
    emit(GenerateQrCodeLoading());
    if(controller.text.isNotEmpty){
      qrCodeText =controller.text;
      emit(GenerateQrCodeSuccess());
    }
  }
  Future<void> saveQRCode(context) async {
    try {
      RenderRepaintBoundary  boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      await ImageGallerySaver.saveImage(pngBytes);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('QR Code saved to Gallery'),
        ),
      );
      emit(InstallImageSuccess());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save QR Code'),
        ),
      );
      emit(InstallImageFailure());
    }
  }


}
