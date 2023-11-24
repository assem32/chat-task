import 'package:chat_task/core/api_service.dart';
import 'package:chat_task/core/color_manger.dart';
import 'package:chat_task/core/firebase_notifcation.dart';
import 'package:chat_task/data/repo/home_repo_implement.dart';
import 'package:chat_task/manger/login/login_cubit.dart';
import 'package:chat_task/manger/login/login_states.dart';
import 'package:chat_task/presintation/home_page/home_view.dart';
import 'package:chat_task/presintation/login/widgets/textfield_login.dart';
import 'package:chat_task/presintation/main_layout/main_layout.dart';
import 'package:chat_task/presintation/register/register_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  var mail = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(
        
      ),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is SuccessLoginState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayoutView()));
          }
          else if(state is ErrorLoginState){
            print(state.error);
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
                TextFormFiledDefault(controller: mail,label: 'E-mail',type: TextInputType.emailAddress,validateMessage: 'Mail is empty',show: false,),
                SizedBox(
                  height: 20,
                ),
                TextFormFiledDefault(controller: password,label: 'Password',type: TextInputType.text,validateMessage: 'Password empty',show: true,),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: ()async{
                 
                  if (_formKey.currentState!.validate()) {
                    
                    LoginCubit.get(context).userLogin(mail: mail.text, pass: password.text);
                            }
                },
                
                 child: Text('Login',style: TextStyle(color: Colors.white),),
                 style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManger.buttonColor)
                 ),
                 Row(
                  children: [
                    Text('Don\'t have account',style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterView()));
                    }, child: Text('Create an account'))
                  ],
                 )
              ],
            ),
          ),
        );
    
        },
           ),
    );
  }
}