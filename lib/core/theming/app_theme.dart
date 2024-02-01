import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTheme{
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    appBarTheme:  AppBarTheme(
      toolbarHeight: 50.h,
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      titleTextStyle: FontStyles.font20WhiteW700,
      iconTheme:  IconThemeData(
        color: const Color(0xFFA200FF),
        size: 20.w,
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 22.w),
      unselectedIconTheme: IconThemeData(size: 22.w),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.kPrimaryColor,
      selectedItemColor: AppColors.kPurpleColor,
      elevation: 0,
      unselectedItemColor: AppColors.kBackgroundColor,
    ),
  );
}