import 'package:chat_task/data/models/user_model.dart';
import 'package:chat_task/presintation/home_page/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  ChatListView({super.key,required this.model});
  List<UserModel> model;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,index)=>ChatItem(user: model[index]),
      separatorBuilder: (context,index)=>SizedBox(
        height: 10,
      ),
      itemCount: model.length,
    );
  }
}