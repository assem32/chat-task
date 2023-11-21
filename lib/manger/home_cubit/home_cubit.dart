import 'package:chat_task/core/constants.dart';
import 'package:chat_task/data/models/user_model.dart';
import 'package:chat_task/manger/home_cubit/home_state.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewCubit extends Cubit<HomeViewStates> {
  HomeViewCubit() : super(HomeViewLoadingState());
  static HomeViewCubit get(context)=>BlocProvider.of(context);

  DatabaseReference ref1 = FirebaseDatabase.instance.ref();

  List<UserModel> users=[];

Future<void> getUsers() async {
  try {
    DatabaseEvent event = await ref1.child(USER_REC).once();

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;

      users.clear();

      data.forEach((key, value) {
        if (value is Map<dynamic, dynamic>) {
          UserModel userModel = UserModel.fromJson(value);
          users.add(userModel);
          
        } else {
          print("Invalid data type for user: $value");
        }
        emit(GetDataSuccess());
      });
      print(users.length);
    } else {
      print("Data is null");
    }
  } catch (error) {
    print("Error: $error");
  }
}



}