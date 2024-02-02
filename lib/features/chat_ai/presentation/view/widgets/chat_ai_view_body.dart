import 'package:flutter/material.dart';
import 'package:flutter_ai/core/di/dependency_injection.dart';
import 'package:flutter_ai/core/theming/app_colors.dart';
import 'package:flutter_ai/core/theming/font_styles.dart';
import 'package:flutter_ai/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ai/core/widgets/loading_or_origin_ai_displayed.dart';
import 'package:flutter_ai/core/widgets/responsive_spacing.dart';
import 'package:flutter_ai/features/chat_ai/data/repos/chat_ai_repo_impl.dart';
import 'package:flutter_ai/features/chat_ai/presentation/manager/chat_ai_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAiViewBody extends StatelessWidget {
  const ChatAiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatAiCubit((getIt.get<ChatAiRepoRepoImpl>())),
      child: BlocBuilder<ChatAiCubit, ChatAiState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ChatAiCubit>(context);
          return Column(children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: state is! ChatAiSuccess
                      ? LoadingOrOriginAiDisplayed(
                          isLoading: state is ChatAiLoading)
                      : Container(
                        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                        padding: EdgeInsetsDirectional.only(
                          start: 16.w,
                          end: 16.w,
                          top: 0.h,
                          bottom: 40.h,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(32),
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            )),
                        child: Text(
                          state.responseText,
                          style: FontStyles.font18WhiteW400,
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
                      'How can I help you today?',
                      style: FontStyles.font20WhiteW700,
                    ),
                    verticalSpacer(10),
                    AppTextFormField(
                      suffixIcon: Icons.send,
                      suffixIconTap: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.chatAi(context: context);
                        }
                      },
                      controller: cubit.promptController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter valid description';
                        }
                        return null;
                      },
                      hintText: 'Message Chat AI...',
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
