import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          var cubit=LayoutCubit.get(context);
          return Scaffold(
            body:cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomScreen(index);
              },
              items:  [
                BottomNavigationBarItem(
                    icon: Icon( cubit.currentIndex==0?Icons.image:Icons.image_outlined,), label: ''),
                BottomNavigationBarItem(
                    icon: Icon( cubit.currentIndex==1?Icons.message:Icons.message_outlined,), label: ''),
                BottomNavigationBarItem(
                    icon: Icon( cubit.currentIndex==2?Icons.shopping_cart:Icons.shopping_cart_outlined,), label: ''),
                BottomNavigationBarItem(
                    icon: Icon( cubit.currentIndex==3?Icons.person:Icons.person_outlined,), label: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}