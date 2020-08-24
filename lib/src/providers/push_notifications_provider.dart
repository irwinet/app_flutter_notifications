
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
//dLG_K61tQIyr41TWs_qYKg:APA91bFGuuaSfEgZkHzrsh2uB0oEtNwBmP2JT5Xfu8XZN5oSIXIgNGGp3LJ6Ev77WmBfdLy5SBp1uuVKe5JP55i1GJDdT0Qon6K40Psebt6U1VgFjkD7ygBfS0D5Mlw23_RFPQrFz9Yg

class PushNotificationsProvider{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messagesStreamController = StreamController<String>.broadcast();
  Stream<String> get messagesStream => _messagesStreamController.stream;

  static Future<dynamic> myBackgroundMessage(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async{

    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print('FCM Token');
    print('Token: $token');

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('OnMessage');
    //print('Message: $message');

    //final argument = message['data']['name'];
    //print('argumento: $argument');

    String argument = 'no-data';
    if(Platform.isAndroid){
      argument = message['data']['name'];
    }
    else{
      argument = message['name'];
    }

    _messagesStreamController.sink.add(argument);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('OnLaunch');
    //print('Message: $message');

    //final argument = message['data']['name'];
    //print('argumento: $argument');

    String argument = 'no-data';
    if(Platform.isAndroid){
      argument = message['data']['name'];
    }
    else{
      argument = message['name'];
    }

    _messagesStreamController.sink.add(argument);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('OnResume');
    //print('Message: $message');

    //final argument = message['data']['name'];
    //print('argumento: $argument');

    String argument = 'no-data';
    if(Platform.isAndroid){
      argument = message['data']['name'];
    }
    else{
      argument = message['name'];
    }

    _messagesStreamController.sink.add(argument);
  }

  dispose(){
    _messagesStreamController?.close();
  }

}