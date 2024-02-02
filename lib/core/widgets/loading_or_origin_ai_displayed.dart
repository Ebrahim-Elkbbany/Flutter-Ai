import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingOrOriginAiDisplayed extends StatelessWidget {
  const LoadingOrOriginAiDisplayed({super.key, required this.isLoading});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(isLoading
        ? 'assets/images/loading.json'
        : "assets/images/ai_logo.json");
  }
}
