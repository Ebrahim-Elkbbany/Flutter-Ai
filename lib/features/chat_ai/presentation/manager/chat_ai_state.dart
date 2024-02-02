part of 'chat_ai_cubit.dart';

@immutable
abstract class ChatAiState {}

class ChatAiInitial extends ChatAiState {}
class ChatAiLoading extends ChatAiState {}
class ChatAiSuccess extends ChatAiState {
  final String responseText;

  ChatAiSuccess({required this.responseText});
}
class ChatAiFailure extends ChatAiState {
  final String errorMessage;

  ChatAiFailure({required this.errorMessage});
}
