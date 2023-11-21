import 'package:chat_task/data/models/message_data.dart';
import 'package:chat_task/presintation/chat_screen/widgets/message_item.dart';
import 'package:chat_task/presintation/home_page/widgets/chat_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({super.key,required this.messageList});
  final List<MessageModel> messageList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,index){
        var messageId=messageList[index].senderId;
        if(messageId==FirebaseAuth.instance.currentUser!.uid)
        {
          print(messageId);
        print(FirebaseAuth.instance.currentUser!.uid);
        return Align(
          alignment: Alignment.centerRight,
          child: MessageItem(
          model: messageList[index],
          color: 0xffeafcca,
                ),
        );}
        else{
          return Align(
          alignment: Alignment.centerLeft,
          child: MessageItem(
          model: messageList[index],
          color: 0xfff0f9fb,
                ),
        );
        }
      },
      separatorBuilder: (context,index)=>SizedBox(
        height: 10,
      ),
      itemCount: messageList.length,
    );
  }
}