import 'package:chat_task/core/color_manger.dart';
import 'package:chat_task/data/models/user_model.dart';
import 'package:chat_task/presintation/chat_screen/chat_view.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key,required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatView(model: user,)));
      },
      child: Card(
        color: ColorManger.backgroundColor,
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:NetworkImage('https://img.freepik.com/free-photo/portrait-happy-smiley-man_23-2149022620.jpg?w=1060&t=st=1700497387~exp=1700497987~hmac=cf1723d7f41a0393961677dc1103ada07476d6a4fdefbc325b895a6599c611db')
              ),
              SizedBox(width: 10,),
              Text(user.name!,style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}