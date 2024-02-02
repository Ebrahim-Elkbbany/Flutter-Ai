import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ai/core/errors/failures.dart';
import 'package:flutter_ai/core/network/dio.dart';
import 'package:flutter_ai/core/network/end_points.dart';
import 'package:flutter_ai/features/chat_ai/data/models/chat_ai_model.dart';
import 'package:flutter_ai/features/chat_ai/data/repos/chat_ai_repo.dart';

class ChatAiRepoRepoImpl implements ChatAiRepo {
  ApiService apiService;

  ChatAiRepoRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ChatAiModel>> chatAi({
    required String prompt,
  }) async {
    try {
      var response =
          await apiService.post(urlEndPoint: EndPoints.chatCompletions, data: {
        'model': 'gpt-3.5-turbo-instruct',
        'prompt': prompt,
        'max_tokens': 1000,
      });
      ChatAiModel chatAiModel = ChatAiModel.fromJson(response);
      return right(chatAiModel);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
