import 'package:chat_task/core/api_service.dart';
import 'package:chat_task/core/color_manger.dart';
import 'package:chat_task/data/models/user_model.dart';
import 'package:chat_task/data/repo/home_repo_implement.dart';
import 'package:chat_task/manger/chat_cubit/chat_cubit.dart';
import 'package:chat_task/manger/chat_cubit/chat_states.dart';
import 'package:chat_task/presintation/chat_screen/widgets/message_listview.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key,required this.model});
  final UserModel model;
  var message =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> ChatCubit(
        HomeRepoImpl(
          ApiService(
            Dio()
          )
        )
      )..getMessage(model.uid.toString()),
      child: BlocConsumer<ChatCubit,ChatStates>(
        listener: (context,state){

        },
        builder: (context,state){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: 
              AssetImage(
                'assets/images/background.jpg',
                ),
                fit: BoxFit.cover
              ),
              
            ),
            child: Scaffold(
              appBar: AppBar(
                title: Text(model.name!,style: TextStyle(color: Colors.white),),
                backgroundColor: ColorManger.appBarColor,
              ),
              backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: MessageListView(messageList: ChatCubit.get(context).model,)),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                                        child: TextField(
                                          
                                          style: TextStyle(color: Colors.white),
                                          controller: message,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorManger.textFormColor,
                                              border: InputBorder.none,
                                              hintText: 'Message...'
                                          ),
                        
                                        ),
                                      ),
                                      Container(
                                        height: 55,
                                        color: ColorManger.buttonColor,
                                        child: MaterialButton( onPressed: () {
                                          print(FirebaseAuth.instance.currentUser?.uid);
                                          print(model.uid);
                                          print(model.token);
                                          ChatCubit.get(context).sendMessage(model.uid.toString(), message.text,model.token);
                                          
                                          message.clear();
                                        },
                                          minWidth: 1.0,
                                          child: Container(
                                            child: Icon(Icons.send,size: 16,color: Colors.white,)),),
                                      )
                      ],
                    ),
                  )
                ],
              ),
            ),
                    ),
          );
    
        },
          ),
    );
  }
}