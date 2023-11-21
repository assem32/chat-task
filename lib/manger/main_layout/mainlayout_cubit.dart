import 'package:chat_task/manger/main_layout/mainlayout_state.dart';
import 'package:chat_task/presintation/home_page/home_view.dart';
import 'package:chat_task/presintation/profile_screen/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutCubit extends Cubit<MainLayoutStates> {
  MainLayoutCubit() : super(MainLayoutInitState());
  static MainLayoutCubit get(context)=>BlocProvider.of(context);

  List<Widget>screens=[
    HomeView(),
    ProfileView()
  ];

  int currentIndex=0;

  void changeIndex(index){
    currentIndex=index;
    emit(ChangeIndexState());
  }

  }