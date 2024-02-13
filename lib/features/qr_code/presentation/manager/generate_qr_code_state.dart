part of 'generate_qr_code_cubit.dart';

@immutable
abstract class GenerateQrCodeState {}

class GenerateQrCodeInitial extends GenerateQrCodeState {}
class GenerateQrCodeSuccess extends GenerateQrCodeState {}
class GenerateQrCodeLoading extends GenerateQrCodeState {}
class GenerateQrCodeFailure extends GenerateQrCodeState {}
class InstallImageSuccess extends GenerateQrCodeState {}
class InstallImageFailure extends GenerateQrCodeState {}
class ClearImageData extends GenerateQrCodeState {}

