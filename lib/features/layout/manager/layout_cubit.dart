import 'package:flutter/material.dart';
import 'package:flutter_ai/features/Image_generator_ai/presentation/view/image_generator_ai_view.dart';
import 'package:flutter_ai/features/chat_ai/presentation/view/chat_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context){
    return BlocProvider.of(context);
  }

  int currentIndex=0;
  void changeBottomScreen(index){
    currentIndex=index;
    emit(ChangeBottomScreen());
  }
  List<Widget>bottomScreen=const[ImageGeneratorAIView(),ChatAiView(),];
}
