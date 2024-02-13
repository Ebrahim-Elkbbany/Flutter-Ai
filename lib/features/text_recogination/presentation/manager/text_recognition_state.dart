part of 'text_recognition_cubit.dart';

@immutable
abstract class TextRecognitionState {}

class TextRecognitionInitial extends TextRecognitionState {}
class PickImageSuccess extends TextRecognitionState {}
class ExportTextSuccess extends TextRecognitionState {}
