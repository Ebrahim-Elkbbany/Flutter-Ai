import 'package:flutter/material.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_ai/core/widgets/custom_button.dart';
import 'package:flutter_ai/core/widgets/responsive_spacing.dart';
import 'package:flutter_ai/features/text_recogination/presentation/manager/text_recognition_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class TextRecognitionView extends StatelessWidget {
  const TextRecognitionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextRecognitionCubit(),
      child: BlocBuilder<TextRecognitionCubit, TextRecognitionState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<TextRecognitionCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Text Recognition',
              ),
            ),
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacer(30),
                    Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: cubit.image != null
                          ? Image.file(cubit.image!,)
                          :  Icon(Icons.camera_enhance,size: 25.w,color: Colors.grey,),
                    ),
                    verticalSpacer(30),
                    CustomButton(
                      buttonName: 'Select Image From Camera',
                      icon: Icons.camera_enhance,
                      onPressed: () async{
                        await cubit.pickImage(ImageSource.camera);
                        cubit.textRecognition(cubit.image!);
                      },
                    ),
                    verticalSpacer(10),
                    CustomButton(
                      icon: Icons.image,
                      buttonName: 'Select Image From Gallery',
                      onPressed: () async{
                        await cubit.pickImage(ImageSource.gallery);
                        cubit.textRecognition(cubit.image!);
                      },
                    ),
                    verticalSpacer(20),
                   cubit.responseText != null ?SelectableText(
                       cubit.responseText!,
                     style: FontStyles.font16WhiteW400,
                   ) :const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
