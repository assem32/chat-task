import 'package:chat_task/core/constants.dart';
import 'package:chat_task/data/models/user_model.dart';
import 'package:chat_task/manger/login/login_cubit.dart';
import 'package:chat_task/manger/register/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  DatabaseReference ref1 = FirebaseDatabase.instance.ref();
    void userRegister({
  required String name,
  required String mail,
  required String pass,
  required String phone,
  required String token
  })
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail, password: pass
    ).then((value)async{
      userCreate(name: name, mail: mail, phone: phone, uid: value.user!.uid,token: token);

     emit(RegisterSuccessState());
    }).catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    });
  }
  void userCreate({
    required String name,
    required String mail,
    required String phone,
    required String uid,
    required String token
    
})async{
    ref1.child(USER_REC).child(uid).set({
      'name':name,
      'email':mail,
      'phone':phone,
      'uid':uid,
      'token':token
    });
    DatabaseEvent event = await ref1.child(USER_REC).child(uid).once();

      Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
        currentUser = UserModel.fromJson(data);
}
}