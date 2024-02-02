import 'package:dartz/dartz.dart';
import 'package:flutter_ai/core/errors/failures.dart';
import 'package:flutter_ai/features/chat_ai/data/models/chat_ai_model.dart';

abstract class ChatAiRepo {
  Future<Either<Failure, ChatAiModel>> chatAi({
    required String prompt,
  });
}