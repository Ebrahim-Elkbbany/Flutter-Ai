import 'package:flutter/material.dart';
import 'package:flutter_ai/core/widgets/extensions.dart';
import 'package:flutter_ai/features/home/data/pages_model.dart';
import 'package:flutter_ai/features/home/presentation/view/category_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter AI 🤖'),
      ),
      body:  GridView.count(
        padding: EdgeInsets.all(20.w),
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: 30 / 18,
        children: List.generate(
          PagesModel.pagesList.length,
              (index) => CategoryContainer(
             categoryText: PagesModel.pagesList[index].pageName ,
             onTap: () {
               context.pushNamedPage(context, PagesModel.pagesList[index].page);
             },
          ),
        ),
      ),
    );
  }
}
