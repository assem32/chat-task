import 'package:chat_task/core/color_manger.dart';
import 'package:chat_task/manger/login/login_cubit.dart';
import 'package:chat_task/manger/profile_cubit/profile_cubit.dart';
import 'package:chat_task/manger/profile_cubit/profile_state.dart';
import 'package:chat_task/presintation/login/widgets/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
   ProfileView({super.key});


  var phone=TextEditingController(text: currentUser!.name);
  var name=TextEditingController(text: currentUser!.phone);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ProfileCubit(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context, state){},
        builder: (context ,state){
          return Scaffold(
            backgroundColor: ColorManger.backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFiledDefault(controller: name,label: 'Name',type: TextInputType.emailAddress,validateMessage: 'Name is empty'),
              SizedBox(height: 20,),
              TextFormFiledDefault(controller: phone,label: 'Phone',type: TextInputType.phone,validateMessage: 'phone empty'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                ProfileCubit.get(context).userUpdate(name: name.text, phone: phone.text, uid: currentUser!.uid!,context: context);
              }, child: Text('Update',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManger.buttonColor)
              )
            ]
            ),
        );
        }
      ),
    );
  }
}