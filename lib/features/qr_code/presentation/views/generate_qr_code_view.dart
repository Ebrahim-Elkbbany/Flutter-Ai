import 'package:flutter/material.dart';
import 'package:flutter_ai/features/qr_code/presentation/manager/generate_qr_code_cubit.dart';
import 'package:flutter_ai/features/qr_code/presentation/views/widgets/generate_qr_code_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateQrCodeView extends StatelessWidget {
  const GenerateQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateQrCodeCubit(),
      child: BlocBuilder<GenerateQrCodeCubit, GenerateQrCodeState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GenerateQrCodeCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Generate QR Code',
              ),
              leading: cubit.controller.text.isNotEmpty
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
                cubit.controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          cubit.saveQRCode(context);
                        },
                        icon: const Icon(
                          Icons.download_outlined,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            body: GenerateQrCodeViewBody(
              cubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
