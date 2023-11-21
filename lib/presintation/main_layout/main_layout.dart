import 'package:chat_task/core/color_manger.dart';
import 'package:chat_task/manger/main_layout/mainlayout_cubit.dart';
import 'package:chat_task/manger/main_layout/mainlayout_state.dart';
import 'package:chat_task/presintation/home_page/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>MainLayoutCubit(),
      child: BlocConsumer<MainLayoutCubit,MainLayoutStates>(
        listener: (context, state){

        },
        builder: (context,state){
          return Scaffold(
          body:  MainLayoutCubit.get(context).screens[ MainLayoutCubit.get(context).currentIndex],
          bottomNavigationBar:
          
        
              BottomNavigationBar(
                backgroundColor: ColorManger.backgroundColor,
                
                currentIndex: MainLayoutCubit.get(context).currentIndex,
                onTap: (index){
                  MainLayoutCubit.get(context).changeIndex(index);
                } ,
                type: BottomNavigationBarType.fixed, items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Add Post'),
          ]),
        );
      
        },
        ),
    );
  }
}
