import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> handelBackgroundMessage(RemoteMessage remoteMessage)async{
  print('title ${remoteMessage.notification?.title}');
  print('body ${remoteMessage.notification?.body}');
  print('date ${remoteMessage.data}');

}

class FirebaseAPI{
  final firebaseMessaging=FirebaseMessaging.instance;

  Future<String?> initNotification()async{
    await firebaseMessaging.requestPermission();
    final FCMToken = await firebaseMessaging.getToken();
    print('the token $FCMToken');
    FirebaseMessaging.onBackgroundMessage(handelBackgroundMessage);
    return FCMToken;
  }
}