import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final IconData? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator ;
  final Function()? suffixIconTap;


  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
     this.validator,
    this.suffixIconTap,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF5F5F5F),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF5F5F5F),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintStyle: hintStyle ?? FontStyles.font16WhiteGrayW400,
        hintText: hintText,
        suffixIcon: suffixIcon==null ? null :GestureDetector(
          onTap: suffixIconTap,
          child: Icon(
            suffixIcon,
            color: AppColors.kPurpleColor,
            size: 20.w,
          ),
        ),
        fillColor: backgroundColor ?? AppColors.kPrimaryColor,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: FontStyles.font18WhiteW400,
      validator: validator,
    );
  }
}
