
import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_ai/core/widgets/responsive_spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonName,
      this.onPressed,
       this.height,
       this.width=double.infinity,
       this.radius, this.style, this.icon,
      })
      : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final double ?height;
  final double ?width;
  final double ?radius;
  final TextStyle? style;
  final  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 50.h,
        width: width ?? double.infinity,

        decoration:  BoxDecoration(
           color: AppColors.kPurpleColor,
          borderRadius: BorderRadius.circular(
          radius ?? 8.w,
        ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
             icon ?? Icons.generating_tokens,
              color: Colors.white,
              size: 22.w,
            ),
            horizontalSpacer(5),
            Text(
              buttonName,
              style: style ?? FontStyles.font18WhiteW700,
            ),
          ],
        ),
      ),
    );
  }
}
