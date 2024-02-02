import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_ai/core/widgets/custom_button.dart';
import 'package:flutter_ai/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ai/core/widgets/loading_or_origin_ai_displayed.dart';
import 'package:flutter_ai/core/widgets/responsive_spacing.dart';
import 'package:flutter_ai/features/Image_generator_ai/presentation/manager/image_generator_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ImageGeneratorAIViewBody extends StatelessWidget {
  const ImageGeneratorAIViewBody(
      {super.key, required this.state, required this.cubit});

  final ImageGeneratorState state;
  final ImageGeneratorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: cubit.imageUrl ==null
                  ? LoadingOrOriginAiDisplayed(isLoading: state is ImageGeneratorLoading)
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.network(
                        cubit.imageUrl!,
                        width: MediaQuery.of(context).size.width - 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
        Container(
          color: AppColors.kPrimaryColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Enter your needed',
                  style: FontStyles.font20WhiteW700,
                ),
                verticalSpacer(10),
                AppTextFormField(
                  controller: cubit.promptController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid description';
                    }
                    return null;
                  },
                  hintText: 'Write your needed here...',
                ),
                verticalSpacer(15),
                CustomButton(
                  buttonName: 'Generate',
                  onPressed: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.imageGenerator(context: context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
