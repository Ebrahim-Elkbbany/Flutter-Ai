import 'package:flutter/material.dart';
import 'package:flutter_ai/core/di/dependency_injection.dart';
import 'package:flutter_ai/core/network/dio.dart';
import 'package:flutter_ai/core/theming/app_theme.dart';
import 'package:flutter_ai/features/Image_generator_ai/presentation/view/image_generator_ai_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupServiceLocator();
  DioHelper.init();
  await ScreenUtil.ensureScreenSize();
  runApp(const FlutterAiApp());
}

class FlutterAiApp extends StatelessWidget {
  const FlutterAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: child,
        );
      },
      child:  const ImageGeneratorAIView(),
    );
  }
}

