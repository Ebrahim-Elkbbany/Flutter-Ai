
import 'package:flutter/material.dart';
import 'package:flutter_ai/features/chat_ai/data/repos/chat_ai_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_ai_state.dart';

class ChatAiCubit extends Cubit<ChatAiState> {
  ChatAiCubit(this.chatAiRepo) : super(ChatAiInitial());
  final ChatAiRepo chatAiRepo;
  TextEditingController promptController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> chatAi({required BuildContext context}) async {
    emit(ChatAiLoading());
    var data = await chatAiRepo.chatAi(prompt: promptController.text);
    data.fold((failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failure.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      emit(ChatAiFailure(errorMessage: failure.errorMessage));
    }, (data) {
      emit(ChatAiSuccess(responseText: data.choices[0].text));
    });
  }
}
