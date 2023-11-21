import 'package:chat_task/core/constants.dart';
import 'package:chat_task/data/models/message_data.dart';
import 'package:chat_task/manger/chat_cubit/chat_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitState());
  static ChatCubit get(context)=>BlocProvider.of(context);

  DatabaseReference ref1 = FirebaseDatabase.instance.ref();


  void sendMessage(String reciverId,message){
    ref1.child(MESSAGE_REC)
    .child(FirebaseAuth.instance.currentUser!.uid.toString()+reciverId)
    .push()
    .set(
      MessageModel(
          senderId: FirebaseAuth.instance.currentUser!.uid.toString(),
          message: message,
          date: DateTime.now().toIso8601String(),
        ).toMap(),
      );

    
  }

  List<MessageModel>model=[];
    void getMessage(String receiverId) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    final path1 = '$currentUserId$receiverId';
    final path2 = '$receiverId$currentUserId';

    ref1.child(MESSAGE_REC).child(path1).onChildAdded.listen((event) {
      handleNewMessage(event);
    });

    ref1.child(MESSAGE_REC).child(path2).onChildAdded.listen((event) {
      handleNewMessage(event);
    });
  }


  void handleNewMessage(event) {
    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> data =
          event.snapshot.value as Map<dynamic, dynamic>;

      // Convert the data to a MessageModel
      MessageModel messageModel = MessageModel.fromJson(data);
      model.add(messageModel);
      emit(ChatSuccessState());

      // Add the updated list to the stream
    }
  }


}