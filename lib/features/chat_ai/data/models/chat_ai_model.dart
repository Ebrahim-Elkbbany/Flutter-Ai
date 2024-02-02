


class ChatAiModel {
  List<Choice> choices;
  int created;
  String id;
  String model;
  String object;
  Usage usage;

  ChatAiModel({
    required this.choices,
    required this.created,
    required this.id,
    required this.model,
    required this.object,
    required this.usage,
  });

  factory ChatAiModel.fromJson(Map<String, dynamic> json) => ChatAiModel(
    choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    created: json["created"],
    id: json["id"],
    model: json["model"],
    object: json["object"],
    usage: Usage.fromJson(json["usage"]),
  );

}

class Choice {
  String finishReason;
  int index;
  dynamic logprobs;
  String text;

  Choice({
    required this.finishReason,
    required this.index,
    required this.logprobs,
    required this.text,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    finishReason: json["finish_reason"],
    index: json["index"],
    logprobs: json["logprobs"],
    text: json["text"],
  );


}

class Usage {
  int completionTokens;
  int promptTokens;
  int totalTokens;

  Usage({
    required this.completionTokens,
    required this.promptTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
    completionTokens: json["completion_tokens"],
    promptTokens: json["prompt_tokens"],
    totalTokens: json["total_tokens"],
  );

}
