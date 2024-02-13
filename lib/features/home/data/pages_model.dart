import 'package:flutter/cupertino.dart';
import 'package:flutter_ai/features/Image_generator_ai/presentation/view/image_generator_ai_view.dart';
import 'package:flutter_ai/features/chat_ai/presentation/view/chat_view.dart';
import 'package:flutter_ai/features/qr_code/presentation/views/generate_qr_code_view.dart';
import 'package:flutter_ai/features/qr_code/presentation/views/scan_qr_code_view.dart';
import 'package:flutter_ai/features/text_recogination/presentation/views/text_recogination_view.dart';

class PagesModel{
  final Widget page;
  final String pageName;

  PagesModel({required this.page, required this.pageName});


  static List<PagesModel> pagesList= [
    PagesModel(page: const ChatAiView(), pageName: 'Chat AI'),
    PagesModel(page: const ImageGeneratorAIView(), pageName: 'Image Generator'),
    PagesModel(page: const TextRecognitionView(), pageName: 'Text Recognition'),
    PagesModel(page: const GenerateQrCodeView(), pageName: 'Generate QR code'),
    PagesModel(page:  const ScanQrCodeView(), pageName: 'Scan QR code'),
  ];
}