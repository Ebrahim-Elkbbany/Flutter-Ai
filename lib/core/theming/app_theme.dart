import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';


class AppTheme{
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      titleTextStyle: FontStyles.font20WhiteW700,
      iconTheme: const IconThemeData(
        color: Color(0xFFA200FF),
      )
    ),
  );
}