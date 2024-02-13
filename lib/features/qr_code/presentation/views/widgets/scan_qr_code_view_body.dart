import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRCodeViewBody extends StatelessWidget {
  const ScanQRCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Key key =GlobalKey() ;
    return  Column(
      children: [
        Expanded(
          flex: 5,
          child:QRView(
            cameraFacing: CameraFacing.back,

            key: key,
            onQRViewCreated: (p0) {
            if (kDebugMode) {
              print('hello');
            }
          },)
        ),
      ],
    );
  }
}
