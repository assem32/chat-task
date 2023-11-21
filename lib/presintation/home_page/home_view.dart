import 'package:chat_task/core/color_manger.dart';
import 'package:chat_task/manger/home_cubit/home_cubit.dart';
import 'package:chat_task/manger/home_cubit/home_state.dart';
import 'package:chat_task/presintation/home_page/widgets/chat_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> HomeViewCubit()..getUsers(),
      child: BlocConsumer<HomeViewCubit,HomeViewStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: ColorManger.backgroundColor,
          body: Column(
            children: [
              Expanded(child: ChatListView(model: HomeViewCubit.get(context).users))
          ]
          ),
        );
    
        },
           ),
    );
  }
}