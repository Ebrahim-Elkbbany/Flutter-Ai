import 'package:flutter/material.dart';
import 'package:flutter_ai/features/qr_code/presentation/views/widgets/scan_qr_code_view_body.dart';

class ScanQrCodeView extends StatelessWidget {
  const ScanQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Scan QR Code🤖',
        ),
      ),
      body: const ScanQRCodeViewBody(),
    );
  }
}
