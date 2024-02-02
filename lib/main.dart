import 'package:flutter/material.dart';
import 'package:flutter_ai/app_bloc_observer.dart';
import 'package:flutter_ai/core/di/dependency_injection.dart';
import 'package:flutter_ai/core/network/dio.dart';
import 'package:flutter_ai/core/theming/app_theme.dart';
import 'package:flutter_ai/features/layout/layout_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
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
      child:  const LayoutView(),
    );
  }
}

