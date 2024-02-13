import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_ai/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ai/core/widgets/responsive_spacing.dart';
import 'package:flutter_ai/features/qr_code/presentation/manager/generate_qr_code_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCodeViewBody extends StatelessWidget {
  const GenerateQrCodeViewBody({super.key, required this.cubit});
  final GenerateQrCodeCubit cubit;


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child:cubit.controller.text.isNotEmpty ? RepaintBoundary(
                    key: cubit.globalKey,
                    child: QrImageView(
                      backgroundColor: Colors.white,
                      data: cubit.qrCodeText! ,
                      version: QrVersions.auto,
                      size: 250.w,
                      gapless: false,
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            'Uh oh! Something went wrong...',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ) : const SizedBox.shrink(),
                ),
              ),
            ),
          ),
          Container(
            color: AppColors.kPrimaryColor,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: 10.w, vertical: 15.h),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter data that needed as QR code',
                    style: FontStyles.font20WhiteW700,
                  ),
                  verticalSpacer(10),
                  AppTextFormField(
                    controller: cubit.controller,
                    suffixIcon: Icons.send,
                    suffixIconTap: () {
                      cubit.convertTextToQrCode();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'you should write anything';
                      }
                      return null;
                    },
                    hintText: 'Generate your QR code...',
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
