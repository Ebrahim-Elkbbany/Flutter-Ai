import 'package:flutter/material.dart';
import 'package:flutter_ai/features/chat_ai/presentation/view/widgets/chat_ai_view_body.dart';


class ChatAiView extends StatelessWidget {
  const ChatAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat AI 🤖',
        ),
      ),
      body:const ChatAiViewBody(),
    );
  }
}
