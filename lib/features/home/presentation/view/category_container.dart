import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.categoryText, this.onTap});
  final String categoryText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.h,
        width: MediaQuery.of(context).size.width / 2.9,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          categoryText,
          style: FontStyles.font16WhiteW400,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
