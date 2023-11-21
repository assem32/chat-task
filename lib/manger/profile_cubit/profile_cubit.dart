import 'package:chat_task/core/constants.dart';
import 'package:chat_task/data/models/user_model.dart';
import 'package:chat_task/manger/login/login_cubit.dart';
import 'package:chat_task/manger/profile_cubit/profile_state.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());
  static ProfileCubit get(context)=>BlocProvider.of(context);


  DatabaseReference ref1 = FirebaseDatabase.instance.ref();


   void userUpdate({
    required String name,
    required String phone,
    required String uid,
    context
    
})
async
{
    ref1.child(USER_REC).child(uid).set({
      'name':name,
      'phone':phone,
      'uid':uid
    });

    DatabaseEvent event = await ref1.child(USER_REC).child(currentUser!.uid!).once();

      Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
        currentUser = UserModel.fromJson(data);

        Fluttertoast.showToast(
        msg: "Updated Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
}
  }