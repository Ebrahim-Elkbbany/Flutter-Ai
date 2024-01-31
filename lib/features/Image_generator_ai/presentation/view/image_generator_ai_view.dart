import 'package:flutter/material.dart';
import 'package:flutter_ai/core/di/dependency_injection.dart';
import 'package:flutter_ai/features/Image_generator_ai/data/repos/image_generator_repo_impl.dart';
import 'package:flutter_ai/features/Image_generator_ai/presentation/manager/image_generator_cubit.dart';
import 'package:flutter_ai/features/Image_generator_ai/presentation/view/widgets/image_generator_ai_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageGeneratorAIView extends StatelessWidget {
  const ImageGeneratorAIView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ImageGeneratorCubit(getIt.get<ImageGeneratorRepoImpl>()),
      child: BlocBuilder<ImageGeneratorCubit, ImageGeneratorState>(
        builder: (context, state) {
          var cubit = context.read<ImageGeneratorCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Image Generator AI 🤖',
              ),
              leading: cubit.imageUrl != null
                  ? IconButton(
                      onPressed: () {
                      cubit.clearImageData();
                      },
                      icon: const Icon(
                        Icons.history_rounded,
                      ),
                    )
                  : const SizedBox.shrink(),
              actions: [
                cubit.imageUrl != null
                    ? IconButton(
                        onPressed: () {
                          cubit.saveImage();
                        },
                        icon: const Icon(
                          Icons.download_outlined,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            body: ImageGeneratorAIViewBody(state: state, cubit: cubit),
          );
        },
      ),
    );
  }
}
