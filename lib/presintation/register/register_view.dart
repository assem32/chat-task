import 'package:chat_task/core/color_manger.dart';
import 'package:chat_task/manger/register/register_cubit.dart';
import 'package:chat_task/manger/register/register_state.dart';
import 'package:chat_task/presintation/login/widgets/textfield_login.dart';
import 'package:chat_task/presintation/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final _formKey = GlobalKey<FormState>();
  var mail = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if (state is RegisterSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayoutView()));
          }
        },
        builder: (context,state){
          return Scaffold(
            backgroundColor: ColorManger.backgroundColor,
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFiledDefault(controller: name,label: 'Name',type: TextInputType.emailAddress,validateMessage: 'Name is empty'),
                SizedBox(height: 20,),
                TextFormFiledDefault(controller: phone,label: 'Phone',type: TextInputType.phone,validateMessage: 'phone empty'),
                SizedBox(height: 20,),
                TextFormFiledDefault(controller: mail,label: 'E-mail',type: TextInputType.emailAddress,validateMessage: 'Mail is empty'),
                SizedBox(height: 20,),
                TextFormFiledDefault(controller: password,label: 'Password',type: TextInputType.text,validateMessage: 'Password empty'),
                SizedBox(height: 20,),
                
                ElevatedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    RegisterCubit.get(context).userRegister(name: name.text, mail: mail.text, phone: phone.text,pass: password.text);
                            }
                },
                 child: Text('Register',style: TextStyle(color: Colors.white),),
                 style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManger.buttonColor
                 ),
                 ),
                 
              ],
            ),
          ),
        );
      
        },
         ),
    );
  }
}