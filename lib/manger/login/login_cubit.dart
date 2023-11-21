import 'package:chat_task/core/constants.dart';
import 'package:chat_task/data/models/user_model.dart';
import 'package:chat_task/manger/login/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

UserModel? currentUser;

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context)=>BlocProvider.of(context);

    DatabaseReference ref1 = FirebaseDatabase.instance.ref();

  void userLogin({
    required String mail,
    required String pass,})async{
    emit(LoadingLoginState());
    FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: mail,
        password: pass
    ).then((UserCredential userCredential) async{
        DatabaseEvent event = await ref1.child(USER_REC).child(userCredential.user!.uid).once();

      Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
        currentUser = UserModel.fromJson(data);
          


      print(userCredential.user!.uid);
      // print(userCredential.user.);

      emit(SuccessLoginState(userCredential.user!.uid));
    }).catchError((error){
      emit(ErrorLoginState(error.toString()));
    });
  }
}